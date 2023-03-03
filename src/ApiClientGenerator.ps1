# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$remoteRepoLocation = "https://github.com/MicrosoftDocs/vsts-rest-api-specs.git"

# The API specification is stored in this location to avoid too long file names
$localRepoLocation = "c:/temp/vsts-rest-api-specs"

# Define the name of the variable used for selecting the target project
$useTargetProjectVariable = '$useTargetProject'

function ComputeFunctionHash {
    param (
        [String] $function
    )

    $stringAsStream = [System.IO.MemoryStream]::new()
    $writer = [System.IO.StreamWriter]::new($stringAsStream)
    $writer.write($function)
    $writer.Flush()
    $stringAsStream.Position = 0
    return Get-FileHash -InputStream $stringAsStream -Algorithm MD5 | Select-Object Hash
}

function ExtractMethods {
    param (
        [Object] $object,
        [String] $path
    )

    $methods = $object.psobject.properties.name
    $objectValue = $object.psobject.properties.value
    $functions = @{}

    if ($objectValue.GetType() -eq [System.Management.Automation.PSCustomObject]) {
        # System.Management.Automation.PSCustomObject
        $function = CreatePsFunction -object $objectValue -path $path -method $methods
        $functionHash = ComputeFunctionHash -function $function
        $functions.Add($functionHash, $function)
    }
    else {
        # System.Object[]
        $methodsArray = $methods.Split(' ')
        for ($i = 0; $i -lt $methodsArray.Count; $i++) {
            # System.Management.Automation.PSCustomObject
            $function = CreatePsFunction -object $objectValue[$i] -path $path -method $methodsArray[$i]
            $functionHash = ComputeFunctionHash -function $function
            $functions.Add($functionHash, $function)
        }
    }

    return $functions.Values
}

function CreatePsFunction {
    param (
        [Object] $object,
        [String] $path,
        [string] $method
    )

    # List parameters
    $parameters = $object.parameters

    $sbParam = [System.Text.StringBuilder]::new()
    $body = '$null'
    foreach ($parameter in $parameters) {
        if($null -ne $parameter.in -and
            ($parameter.in -eq 'path' -or $parameter.in -eq 'body') -and
            $parameter.name -ne 'collection' -and
            $parameter.name -ne 'organization' -and
            $parameter.name -ne 'project') {
            $parameterName = $parameter.name.Replace('$','')
            $parameterType = $parameter.type ?? 'PSObject'
            if ($parameterType -eq 'integer') {
                $parameterType = 'int'
            }
            if ($parameterName.Contains('.')) {
                $parameterName = $parameterName.Split('.')[1]
            }
            [void]$sbParam.Append("[$parameterType] $" + "$($parameterName), ")

            if($parameterName -eq 'body') {
                $body = '$body'
            }
        }
    }

    $sbParamString = $sbParam.ToString()

    $parametersString = ""
    if ($sbParamString.Length -gt 2) {
        $parametersString = $sbParamString.Substring(0,$sbParamString.Length-2)
    }

    # Include [bool] $useTargetProject parameter
    $parametersString = "[bool] $useTargetProjectVariable, " + $parametersString
    $parametersString = $parametersString.TrimEnd(', ')

    # Adjust description and path
    $description = $object.description -replace '\n', ''
    $path = $path -replace '\$', ''
    $path = $path -replace '{', '$' -replace '}', ''
    $path = $path -replace '\$organization', ''
    $path = $path -replace '\$collection', ''
    $path = $path -replace '\$project', ''
    $path = $path -replace '/_apis', ''
    $path = $path.TrimStart('/')

    $functionName = $object."x-ms-vss-method"

    # Handle duplicates for Head calls
    if ($method -eq 'head') {
        $functionName = $functionName + '_Head'
    }

    # Generate function
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine('    # ' + $description)
    [void]$sb.AppendLine('    [PSObject] ' + $functionName + '(' + $parametersString + ') {')
    [void]$sb.AppendLine('        return $this.Request(' + $useTargetProjectVariable + ', ''' + $method + ''', "' + $path + '", $this.apiVersion, ' + $body + ')')
    [void]$sb.AppendLine('    }')

    return $sb.ToString()
}

if (!(Test-Path -Path $localRepoLocation)) {
    Write-Host "Cloning $remoteRepoLocation..."
    git clone $remoteRepoLocation $localRepoLocation
}

$specifications = Get-ChildItem -Path "$localRepoLocation\specification" -Directory
$p_index = 1
foreach ($specification in $specifications)
{
    $progress = [math]::floor($p_index / $specifications.count * 100)

    Write-Progress -Activity "Generating clients..." -Status "$progress% Complete [$($specification.name)]" -PercentComplete $progress
    $p_index++

    $apiVersions = Get-ChildItem -Path "$localRepoLocation\specification\$($specification.name)" -Directory

    foreach ($apiVersion in $apiVersions)
    {
        $endpoints = Get-ChildItem -Path "$localRepoLocation\specification\$($specification.name)\$($apiVersion.name)" -File

        foreach ($endpoint in $endpoints)
        {
            $endpointName = $endpoint.name.substring(0,1).toupper()+$endpoint.name.substring(1, $endpoint.name.length-6)
            $endpointName = $endpointName -replace '-o', 'O'
            $apiClientName = $endpointName + "ApiClient"

            $jsonSpec = Get-Content -Path "$localRepoLocation\specification\$($specification.name)\$($apiVersion.name)\$($endpoint.name)"

            # Replace empty keys
            $jsonSpec = $jsonSpec -replace '""', '"empty"'

            $spec = $jsonSpec | ConvertFrom-Json

            $sb = [System.Text.StringBuilder]::new()
            [void]$sb.AppendLine("# This file was auto-generated. Do not edit.")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("using module .\..\..\AzureDevOpsApiClient.psm1")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("class $apiClientName : AzureDevOpsApiClient {")
            [void]$sb.AppendLine('    [string] $apiVersion = ''' + $spec.info.version + '''')
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("    # $apiClientName(" + '[string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)')
            [void]$sb.AppendLine('    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}')
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("    $apiClientName(" + '[string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)')
            [void]$sb.AppendLine('        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}')
            [void]$sb.AppendLine("")


            foreach ($path in $spec.paths) {
                $paths = $path.psobject.properties.name
                $pathObject = $path.psobject.properties.value

                if ($pathObject.count -gt 0) {  # skip specs with empty paths
                    if ($pathObject.GetType() -eq [System.Management.Automation.PSCustomObject]) {
                        # System.Management.Automation.PSCustomObject
                        $functionsString = ExtractMethods -object $pathObject -path $paths
                        [void]$sb.AppendLine($functionsString)
                    }
                    else {
                        # System.Object[]
                        for ($i = 0; $i -lt $pathObject.Count; $i++) {
                            # System.Management.Automation.PSCustomObject
                            $pathsArray = $paths.Split(' ')
                            $functionsString = ExtractMethods -object $pathObject[$i] -path $pathsArray[$i]
                            [void]$sb.AppendLine($functionsString)
                        }
                    }
                }
            }

            [void]$sb.AppendLine("}")
            $apiClientClass = $sb.ToString()

            $apiClientDirectory = "ApiClients\$($apiVersion.name)"

            if (!(Test-Path -Path $apiClientDirectory)) {
                New-Item $apiClientDirectory -ItemType Directory
            }

            $apiClientClass | Out-File -FilePath "$apiClientDirectory\$apiClientName.psm1"
        }
    }
}

Write-Progress -Activity "Generating clients..." -Completed

# Generate scripts to include ApiClients modules
$apiClientsDirectory = '.\ApiClients'

$apiClientVersions = Get-ChildItem $apiClientsDirectory -directory

foreach ($version in $apiClientVersions) {
    $apiClients = Get-ChildItem $version -file
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine("# This file was auto-generated. Do not edit.")
    [void]$sb.AppendLine("")

    foreach ($apiClient in $apiClients) {
        $relativePath = Get-Item $apiClient | Resolve-Path -Relative
        $relativePath = $relativePath -replace "\\ApiClients", ""
        [void]$sb.AppendLine("using module ""$relativePath""")
    }

    $sb.ToString() | Out-File -FilePath "$apiClientsDirectory\$($version.PSChildName).ps1"
}

# Remove-Item -Path $localRepoLocation -Recurse -Force

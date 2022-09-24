# MIT License

# Copyright (c) 2022 Filip Liwiński

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

$remoteRepoLocation = "https://github.com/MicrosoftDocs/vsts-rest-api-specs.git"
$localRepoLocation = "c:/temp/vsts-rest-api-specs"

function ExtractMethods {
    param (
        [Object] $object,
        [String] $path
    )

    $methods = $object.psobject.properties.name
    $objectValue = $object.psobject.properties.value
    $functions = @()

    if ($objectValue.GetType() -eq [System.Management.Automation.PSCustomObject]) {
        # System.Management.Automation.PSCustomObject
        $functions += CreatePsFunction -object $objectValue -path $path -method $methods
    }
    else {
        # System.Object[]
        for ($i = 0; $i -lt $object.Count; $i++) {
            # System.Management.Automation.PSCustomObject
            $methodsArray = $methods.Split(' ')
            $functions += CreatePsFunction -object $objectValue[$i] -path $path -method $methodsArray[$i]
        }
    }

    return $functions
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
        if($parameter.in -ne $null) {
            $parameterType = $parameter.type ?? 'PSObject'
            [void]$sbParam.Append("[$parameterType] $" + "$($parameter.name), ")

            if($parameter.name -eq 'body') {
                $body = '$body'
            }
        }
    }

    $sbParamString = $sbParam.ToString()
    $parametersString = $sbParamString.Substring(0,$sbParamString.Length-2)

    # Adjust description and path
    $description = $object.description -replace '\n', ''
    $path = $path -replace '{', '{$'

    # Generate function
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine('    # ' + $description)
    [void]$sb.AppendLine('    [PSObject] ' + $object."x-ms-vss-method" + '(' + $parametersString + ') {')
    [void]$sb.AppendLine('        return $this.Request(''' + $method + ''', "' + $path + '", $APIVersion, ' + $body + ')')
    [void]$sb.AppendLine('    }')

    return $sb.ToString()
}

if (!(Test-Path -Path $localRepoLocation)) {
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
            [void]$sb.AppendLine(" ")
            [void]$sb.AppendLine("class $apiClientName {")
            [void]$sb.AppendLine('    [string] $APIVersion = ''' + $spec.info.version + '''')
            [void]$sb.AppendLine('')

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
#


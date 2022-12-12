# MIT License

# Copyright (c) 2021 Filip Liwiński

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

$apiClient = [BuildOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken, 
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Export-Definitions {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = '',
        [bool] $expand = $false
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $definitions = $apiClient.GetDefinitions($useTargetProject)

    if ($expand) {
        for ($i = 0; $i -lt $definitions.Count; $i++) {
            $definitions[$i] = $apiClient.GetDefinition($useTargetProject, $definitions[$i].id)
        }
    }

    if ($definitions.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($definition in $definitions) {
        $name = $definition.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $definition -Depth 100 > "$outputPath\$name.json"
    }
}


function Copy-BuildDefinition {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [psobject] $buildDefinition
    )
    
    if($buildDefinition.path -contains('Deprecated')){
        return $null
    }
    $repository = $apiClient.GetRepository( $projectName, $buildDefinition.repository.name)
    $newBuildDefinition = @{
        triggers                  = @(
            @{
                settingsSourceType           = 2
                batchChanges                 = $false
                maxConcurrentBuildsPerBranch = 1
                triggerType                  = 'continuousIntegration'
            }
        )
        jobAuthorizationScope     = 'projectCollection'
        jobTimeoutInMinutes       = 60
        jobCancelTimeoutInMinutes = 5

        process                   = $buildDefinition.process
        repository                = @{
            properties         = @{
                cloneUrl          = $repository.remoteUrl
                fullName          = $repository.name
                defaultBranch     = "refs/heads/master"
                isFork            = "False"
                safeRepository    = $repository.id
                reportBuildStatus = $true
            }
            id                 = $repository.id
            type               = "TfsGit"
            name               = $repository.name
            url                = $repository.remoteUrl
            defaultBranch      = $repository.defaultBranch
            checkoutSubmodules = $false
        }
        quality                   = 'definition'
        name                      = $buildDefinition.name
        path                      = $buildDefinition.path
        type                      = "build"
        queueStatus               = "enabled"
        revision                  = 1
        queue = @{
            name = "Default"
        }
    }
 Write-Output "repository name: $($buildDefinition.name)"
 Write-Output "definition $($repository.name)"
 Add-BuildDefinition -projectName $projectName -apiClient $apiClient -buildDefinition $newBuildDefinition
    
}
function Get-BuildDefinitions {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    return $sourceApiClient.GetBuildDefinitions($projectName)
    # $definitions = $sourceApiClient.GetBuildDefinitions($projectName)

    # for ($i = 0; $i -lt $definitions.Count; $i++) {     
    #     $definitions[$i] = $sourceApiClient.GetBuildDefinition($projectName, $definitions[$i].id)
    #     if($i -lt 5){
    #         return $definitions
    #     }
    # }
    # return $definitions
}

function Add-BuildDefinition {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [psobject] $buildDefinition
    )
    return $apiClient.CreateBuildDefinition($buildDefinition, $projectName)
}

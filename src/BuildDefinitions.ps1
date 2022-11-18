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

function Export-BuildDefinitions {
    param (
        [string] $projectName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient,
        [bool] $expand = $false
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $definitions = $apiClient.GetBuildDefinitions($projectName)

    if ($expand) {
        for ($i = 0; $i -lt $definitions.Count; $i++) {
            $definitions[$i] = $apiClient.GetBuildDefinition($projectName, $definitions[$i].id)
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

function Import-BuildDefinitions {
    param (
        [string] $projectName,
        [PSObject] $repository,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [string] $pipelineFolderName
    )
    Write-Output $pipelineFolderName

    if ($pipelineFolderName -eq "pipeline" -or $pipelineFolderName -eq "pipelines" ) {

        New-AzBuildDefinition -projectName $projectName -repository $repository -apiClient $apiClient -pipelineFolderName $pipelineFolderName -isBuildPipeline $true
        New-AzBuildDefinition -projectName $projectName -repository $repository -apiClient $apiClient -pipelineFolderName $pipelineFolderName -isBuildPipeline $false
   
    }
    else {
        Write-Warning "$("No pipeline folder found for repo " + $repository.name)"
        return $null
    }
}

function New-AzBuildDefinition {
    param (
        [string] $projectName,
        [PSObject] $repository,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [string] $pipelineFolderName,
        [bool] $isBuildPipeline
    )

    $buildDefinition = @{
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

        process                   = Get-DefinitionProcess -isBuild $isBuildPipeline -pipelineFolderName $pipelineFolderName
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
            defaultBranch      = "refs/heads/master"
            checkoutSubmodules = $false
        }
        quality                   = 'definition'
        name                      = Get-DefinitionName -isBuild $isBuildPipeline
        path                      = Get-DefinitionPath -isBuild $isBuildPipeline
        type                      = "build"
        queueStatus               = "enabled"
        revision                  = 1
    }

    Write-Output $buildDefinition | ConvertTo-Json

    
    return $apiClient.CreateBuildDefinition($buildDefinition, $projectName)
    
}

function Get-DefinitionProcess {
    param (
        [bool] $isBuild,
        [string] $pipelineFolderName
    )
    if ($isBuild) {
        return Get-DefinitionProcessForBuild -isBuild $isBuildPipeline -pipelineFolderName $pipelineFolderName

    }
    return Get-DefinitionProcessForPR -isBuild $isBuildPipeline -pipelineFolderName $pipelineFolderName
}

function Get-DefinitionPath {
    param (
        [bool] $isBuild
    )
    if ($isBuild) {
        return "\\Jenkins build pipelines"

    }
    return "\\Jenkins pr pipelines"
}

function Get-DefinitionName {
    param (
        [bool] $isBuild
    )
    if ($isBuild) {
        return "$($repository.name + "-build-jenkins")"

    }
    return "$($repository.name + "-pr-jenkins")"
}

function Get-DefinitionProcessForBuild {
    param (
        [bool] $isBuild,
        [string] $pipelineFolderName
    )

        if ($pipelineFolderName -eq 'pipeline') {
            return  @{
                yamlFilename = 'pipeline/build-jenkins.yml'
                type         = 2
            }
        }
        return @{
            yamlFilename = 'pipelines/build-jenkins.yml'
            type         = 2
        }

}

function Get-DefinitionProcessForPR {
    param (
        [bool] $isBuild,
        [string] $pipelineFolderName
    )

    if ($pipelineFolderName -eq 'pipeline') {
        return  @{
            yamlFilename = 'pipeline/pr-jenkins.yml'
            type         = 2
        }
    }
    return  @{
        yamlFilename = 'pipelines/pr-jenkins.yml'
        type         = 2
    }
}

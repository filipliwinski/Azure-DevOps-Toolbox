# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$buildApiClient = [BuildOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

#region Definitions

function New-Definition {
    param (
        [switch] $useTargetProject,
        [string] $name,
        [string] $path,
        [string] $repositoryId,
        [string] $repositoryType,
        [int] $processType,
        [string] $processYamlFilename,
        [string] $defaultAgentPoolName
    )

    $definition = @{
        name = $name
        path = $path
        repository = @{
            id = $repositoryId
            type = $repositoryType
        }
        process = @{
            type = $processType
            yamlFilename = $processYamlFilename
        }
        queue = @{
            name = $defaultAgentPoolName
        }
    }

    return $buildApiClient.CreateDefinition($useTargetProject, $definition)
}

function Get-Definitions {
    param (
        [switch] $useTargetProject
    )

    $definitions = $buildApiClient.GetDefinitions($useTargetProject)

    return $definitions.value
}

function Get-Definition {
    param (
        [switch] $useTargetProject,
        [int] $id
    )

    return $buildApiClient.GetDefinition($useTargetProject, $id)
}

function Remove-Definition {
    param (
        [switch] $useTargetProject,
        [int] $id
    )

    return $buildApiClient.DeleteDefinition($useTargetProject, $id)
}

function Export-Definitions {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = '',
        [bool] $expand = $false
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $definitions = Get-Definitions -useTargetProject

    if ($expand) {
        for ($i = 0; $i -lt $definitions.Count; $i++) {
            $definitions[$i] = Get-Definition -useTargetProject -id $definitions[$i].id
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

function Copy-Definitions {
    param (
        [switch] $useTargetProject,
        [psobject] $definitions
    )

    $i = 0

    foreach ($definition in $definitions) {
        $progress = [math]::floor($i / $definitions.count * 100)

        Write-Progress -Activity "Copying definitions..." -Status "$progress% complete ($($definition.name))" -PercentComplete $progress
        $i++

        Copy-Definition -useTargetProject:$useTargetProject -definition $definition
    }

    Write-Progress -Activity "Copying definitions..." -Completed
}

function Copy-Definition {
    param (
        [switch] $useTargetProject,
        [psobject] $definition
    )
    
#     if($buildDefinition.path -contains('Deprecated')){
#         return $null
#     }
#     $repository = $buildApiClient.GetRepository( $projectName, $buildDefinition.repository.name)    # TODO Fix dependency
#     $newBuildDefinition = @{
#         triggers                  = @(
#             @{
#                 settingsSourceType           = 2
#                 batchChanges                 = $false
#                 maxConcurrentBuildsPerBranch = 1
#                 triggerType                  = 'continuousIntegration'
#             }
#         )
#         jobAuthorizationScope     = 'projectCollection'
#         jobTimeoutInMinutes       = 60
#         jobCancelTimeoutInMinutes = 5

#         process                   = $buildDefinition.process
#         repository                = @{
#             properties         = @{
#                 cloneUrl          = $repository.remoteUrl
#                 fullName          = $repository.name
#                 defaultBranch     = "refs/heads/master"
#                 isFork            = "False"
#                 safeRepository    = $repository.id
#                 reportBuildStatus = $true
#             }
#             id                 = $repository.id
#             type               = "TfsGit"
#             name               = $repository.name
#             url                = $repository.remoteUrl
#             defaultBranch      = $repository.defaultBranch
#             checkoutSubmodules = $false
#         }
#         quality                   = 'definition'
#         name                      = $buildDefinition.name
#         path                      = $buildDefinition.path
#         type                      = "build"
#         queueStatus               = "enabled"
#         revision                  = 1
#         queue = @{
#             name = "Default"
#         }
#     }
#  Write-Output "repository name: $($buildDefinition.name)"
#  Write-Output "definition $($repository.name)"

    New-Definition -useTargetProject:$useTargetProject `
        -name $definition.name `
        -path $definition.path `
        -repositoryId $definition.repository.id `
        -repositoryType $definition.repository.type `
        -processType $definition.process.type `
        -processYamlFilename $definition.process.yamlFilename `
        -defaultAgentPoolName $definition.queue.name
}

#endregion Definitions
#region Folders

function Get-Folders {
    param (
        [switch] $useTargetProject,
        [string] $path = ''
    )

    return $buildApiClient.GetFolders($useTargetProject, $path).value
}

#endregion Folders
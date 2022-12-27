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
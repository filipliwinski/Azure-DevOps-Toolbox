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

. .\git\PullRequests.ps1

<#
        .SYNOPSIS
        Gets all repositories for the specified project.

        .DESCRIPTION
        Gets all repositories for the specified project.

        .PARAMETER projectName
        Specifies the project name.

        .PARAMETER apiClient
        Specifies the API client to use.

        .OUTPUTS
        System.Array. Returns an array with repositories.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#get-repositories

    #>
function Get-Repositories {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $repositories = $apiClient.GetRepositories($projectName)

    return $repositories
}

<#
        .SYNOPSIS
        Gets a repository with the specified name.

        .DESCRIPTION
        Gets a repository with the specified name.

        .PARAMETER projectName
        Specifies the project name.

        .PARAMETER repositoryName
        Specifies the repository name.

        .PARAMETER apiClient
        Specifies the API client to use.

        .OUTPUTS
        System.Object. Returns an object with the repository details.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#get-repositorybyname

    #>
function Get-RepositoryByName {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $repositories = $apiClient.GetRepositories($projectName)

    if ($repositories.Count -eq 0) {
        return $null
    }

    return $repositories | Where-Object { $_.name -eq $repositoryName }
}

<#
        .SYNOPSIS
        Exports repositories data as JSON to a file.

        .DESCRIPTION
        Exports repositories data as JSON to a file.

        .PARAMETER projectName
        Specifies the project name.

        .PARAMETER outputPath
        Specifies the location of the output file.

        .PARAMETER apiClient
        Specifies the API client to use.

        .OUTPUTS
        None.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#export-repositories

    #>
function Export-Repositories {
    param (
        [string] $projectName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $repositories = $apiClient.GetRepositories($projectName)

    if ($repositories.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($repository in $repositories) {
        $name = $repository.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $repository -Depth 100 > "$outputPath\$name.json"
    }
}

function Migrate-Repositories {
    param (
        [string] $sourceProjectName,
        [string] $destinationProjectId,
        [string] $destinationProjectName,
        [AzureDevOpsServicesAPIClient] $sourceApiClient,
        [AzureDevOpsServicesAPIClient] $destinationApiClient
    )
    $repositories = Get-Repositories -projectName $sourceProjectName -apiClient $sourceApiClient
    $pipeLineRelatedRepos = Get-PipelineRelatedRepositories -repositories $repositories
 
    Write-Output $pipeLineRelatedRepos

    Create-Repositories -projectName $destinationProjectName -apiClient $destinationApiClient -repositories $pipeLineRelatedRepos
}

function Get-Repositories {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    return $apiClient.GetRepositories($projectName)
}

function Create-Repositories {
    param (
        [string] $projectName,
        [PSObject] $repositories,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $existingRepositories = Get-Repositories -projectName $projectName -apiClient $apiClient 

    foreach ($repository in $repositories) { 

        if (-not ($existingRepositories.name -contains $repository.name)) {

            $repositoryToCreate = Convert-RepositoryToJson -repository $repository

            $createdRepo = Create-Repository -projectName $destinationProjectName -apiClient $destinationApiClient -repositoryToCreate $repositoryToCreate
            Mirror-Repository -sourceRemoteUrl $repository.remoteUrl -destinationRemoteUrl $createdRepo.remoteUrl -repository $repositoryToCreate.name

            $pullRequests = Get-PullRequests -status 'active' -repositoryId $repository.id -projectName $sourceProjectName -apiClient $sourceApiClient
            Mirror-PullRequests -pullRequests $pullRequests -apiClient $destinationApiClient -destinationProjectName $destinationProjectName -destinationRepositoryId  $createdRepo.id
            # TODO! add here the pipeline export
        }
        else {
            $destinationRepository = $existingRepositories | Where-Object name -eq $repository.name 
            $pullRequests = Get-PullRequests -status 'active' -repositoryId $repository.id -projectName $sourceProjectName -apiClient $sourceApiClient
            Mirror-PullRequests -pullRequests $pullRequests -apiClient $destinationApiClient -destinationProjectName $destinationProjectName -destinationRepositoryId  $destinationRepository.id
            # TODO! add here the pipeline export
        }
    }
    return $response
}


function Create-Repository {
    param (
        [string] $projectName,
        [PSObject] $repositoryToCreate,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    $response = $apiClient.CreateRepository($repositoryToCreate, $projectName, 'users/heads/master')
    
    return $response
}

function Mirror-Repository {
    param (
        [string] $sourceRemoteUrl,
        [string] $destinationRemoteUrl,
        [string] $repositoryName
    )

    git clone --bare $sourceRemoteUrl temp/repos/$repositoryName

    $dir = 'temp/repos/' + $repositoryName
    
    Push-Location $dir

    git push --mirror $destinationRemoteUrl 

    Pop-Location
}

function Get-PipelineRelatedRepositories {
    param (
        [psobject] $repositories
    )

    $pipeLineRelatedRepos = @()
    foreach ($repository in $repositories) { 

        if ($repository.name -eq 'devops' -or $repository.name -eq 'pipeline-shared-libs' -or $repository.name -eq 'release-management') {
            $pipeLineRelatedRepos += $repository
        }
    }
    return $pipeLineRelatedRepos
}

function Convert-RepositoryToJson {
    param (
        [psobject] $repository
    )
    $repositoryJson = @{
        'name'    = $repository.name
        'project' = @{
            'id' = $destinationProjectId
        }
    }
    return $repositoryJson
}
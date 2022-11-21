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

function Import-Repositories {
    param (
        [string] $sourceProjectName,
        [string] $destinationProjectId,
        [string] $destinationProjectName,
        [AzureDevOpsServicesAPIClient] $sourceApiClient,
        [AzureDevOpsServicesAPIClient] $destinationApiClient
    )
    $repositories = Get-Repositories -projectName $sourceProjectName -apiClient $sourceApiClient
    $pipeLineRelatedRepos = Get-PipelineRelatedRepositories -repositories $repositories
    $nonPipelineRelatedRepos = Get-NonPipelineRelatedRepositories -repositories $repositories
    Write-Output $pipeLineRelatedRepos

  
    New-AzDevOpsRepositories -projectName $destinationProjectName -apiClient $destinationApiClient -repositories $pipeLineRelatedRepos -definitions $definitions 
    New-AzDevOpsRepositories -projectName $destinationProjectName -apiClient $destinationApiClient -repositories $nonPipelineRelatedRepos -definitions $definitions
}

function Get-Repositories {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    return $apiClient.GetRepositories($projectName)
}

function New-AzDevOpsRepositories {
    param (
        [string] $projectName,
        [PSObject] $repositories,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [PSObject] $definitions
    )

    $existingRepositories = Get-Repositories -projectName $projectName -apiClient $apiClient 

    foreach ($repository in $repositories) { 

        $pipelineFolderName = Get-FolderNameForRepo -repositoryName $repository.name
        
        if (-not ($existingRepositories.name -contains $repository.name)) {

            $repositoryToCreate = Convert-RepositoryToJson -repository $repository

            $createdRepo = New-AzDevOpsRepository -projectName $destinationProjectName -apiClient $destinationApiClient -repositoryToCreate $repositoryToCreate
           
            Copy-Repository -sourceRemoteUrl $repository.remoteUrl -destinationRemoteUrl $createdRepo.remoteUrl -repository $repositoryToCreate.name
          
            # $result = Import-BuildDefinitions -projectName $destinationProjectName -repository $repositoryToCreate -apiClient $destinationApiClient -pipelineFolderName $pipelineFolderName
            # Write-Output $result | ConvertTo-Json
       
            # $pullRequests = Get-PullRequests -status 'active' -repositoryId $repository.id -projectName $sourceProjectName -apiClient $sourceApiClient 
            # Import-PullRequests -pullRequests $pullRequests -apiClient $destinationApiClient -destinationProjectName $destinationProjectName -destinationRepositoryId  $createdRepo.id
            # TODO! add here the pipeline export
        }
        else {
            $definitionYamlFilename = $definitions | Where-Object {$_.repository.name -eq $repository.name}
            $destinationRepository = $existingRepositories | Where-Object name -eq $repository.name 
           
            $result = Import-BuildDefinitions -projectName $destinationProjectName -repository $destinationRepository -apiClient $destinationApiClient -definitionYamlFilename $definitionYamlFilename
            Write-Output $result 

            # $pullRequests = Get-PullRequests -status 'active' -repositoryId $repository.id -projectName $sourceProjectName -apiClient $sourceApiClient
            # Import-PullRequests -pullRequests $pullRequests -apiClient $destinationApiClient -destinationProjectName $destinationProjectName -destinationRepositoryId  $destinationRepository.id
            # TODO! add here the pipeline export
        }
    }
    return $response
}


function New-AzDevOpsRepository {
    param (
        [string] $projectName,
        [PSObject] $repositoryToCreate,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    $response = $apiClient.CreateRepository($repositoryToCreate, $projectName, 'users/heads/master')
    
    return $response
}

function Copy-Repository {
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

    return $pipelineFolderName
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

function Get-NonPipelineRelatedRepositories {
    param (
        [psobject] $repositories
    )

    $pipeLineRelatedRepos = @()
    foreach ($repository in $repositories) { 

        if ($repository.name -ne 'devops' -or $repository.name -ne 'pipeline-shared-libs' -or $repository.name -ne 'release-management') {
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

function Get-FolderNameForRepo {
    param (
        [string] $repositoryName
    )
    if ($repositoryName -eq 'verification-store' -or 
        $repositoryName -eq 'mitbasic-identity-provider' -or 
        $repositoryName -eq 'identity-registry-store' -or 
        $repositoryName -eq 'identity-registry-batch-reindexer' -or 
        $repositoryName -eq 'identity-api' -or 
        $repositoryName -eq 'event-api' -or 
        $repositoryName -eq 'contact-subscription-store' -or 
        $repositoryName -eq 'common-resource-servers' -or
        $repositoryName -eq 'distribution-activator') {
        return "pipeline"
    }
    return "pipelines"
}
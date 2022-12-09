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

    return $repositories.value
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

function New-Repository {
    param (
        [string] $projectName,
        [PSObject] $repository,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    $response = $apiClient.CreateRepository($repository, $projectName, 'users/heads/master')
    
    return $response
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

function Copy-Repositories {
    param (
        [string] $sourceProjectName,
        [string] $targetProjectName,
        [AzureDevOpsServicesAPIClient] $sourceApiClient,
        [AzureDevOpsServicesAPIClient] $targetApiClient
    )
    
    $repositories = Get-Repositories -projectName $sourceProjectName -apiClient $sourceApiClient
    $i = 0

    foreach ($repository in $repositories) {
        $progress = [math]::floor($i / $repositories.count * 100)

        Write-Progress -Activity "Copying repositories..." -Status "$progress% Complete [$($repository.name)]" -PercentComplete $progress
        $i++

        Copy-Repository -projectName $targetProjectName -repository $repository -apiClient $targetApiClient
    }

    Write-Progress -Activity "Copying repositories..." -Completed
}

function Copy-Repository {
    param (
        [string] $projectName,
        [PSObject] $repository,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $newRepository = @{
        'name' = $repository.name
    }

    try {
        $newRepository = New-Repository -projectName $projectName -repository $newRepository -apiClient $apiClient

        $tempLocation = 'temp/repos/' + $repository.name

        git clone --bare $repository.remoteUrl $tempLocation
        
        Push-Location $tempLocation

        git push --mirror $newRepository.remoteUrl

        Pop-Location

        Remove-Item -Recurse -Force $tempLocation

        return $newRepository
    }
    catch {
        Write-Host "The repository $($repository.name) already exists."
    }
    
    return $null
}



function Get-PullRequest {
    param (
        [string] $projectName,
        [string] $repositoryId,
        [int] $pullRequestId,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    return $apiClient.GetPullRequest($repositoryId, $pullRequestId, $projectName)
}

function Create-PullRequest {
    param (
        [PSObject] $body,
        [string] $projectName,
        [string] $repositoryId,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    return $apiClient.CreatePullRequest($body, $repositoryId, $projectName)
}

# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$gitApiClient = [GitOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

<#
        .SYNOPSIS
        Gets all repositories for the specified project.

        .DESCRIPTION
        Gets all repositories for the specified project.

        .OUTPUTS
        System.Array. Returns an array with repositories.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#get-repositories

    #>
function Get-Repositories {
    param (
        [switch] $useTargetProject
    )

    $repositories = $gitApiClient.GetRepositories($useTargetProject)

    return $repositories.value
}

function Get-Repository {
    param (
        [switch] $useTargetProject,
        [string] $id
    )

    $repository = $gitApiClient.GetRepository($useTargetProject, $id)

    return $repository
}

<#
        .SYNOPSIS
        Gets a repository with the specified name.

        .DESCRIPTION
        Gets a repository with the specified name.

        .PARAMETER repositoryName
        Specifies the repository name.

        .OUTPUTS
        System.Object. Returns an object with the repository details.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#get-repositorybyname

    #>
function Get-RepositoryByName {
    param (
        [switch] $useTargetProject,
        [string] $name
    )

    $repository = $gitApiClient.GetRepository($useTargetProject, $name)

    return $repository
}

function Remove-Repository {
    param (
        [switch] $useTargetProject,
        [string] $id
    )

    $gitApiClient.DeleteRepository($useTargetProject, $id)
}

function New-Repository {
    param (
        [switch] $useTargetProject,
        [string] $name
    )

    $repository = @{
        'name' = $name
    }

    $response = $gitApiClient.CreateRepository($useTargetProject, $repository)

    return $response
}

<#
        .SYNOPSIS
        Exports repositories data as JSON to a file.

        .DESCRIPTION
        Exports repositories data as JSON to a file.

        .PARAMETER outputPath
        Specifies the location of the output file.

        .OUTPUTS
        None.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#export-repositories

    #>
function Export-Repositories {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = ''
    )

    $repositories = $gitApiClient.GetRepositories($useTargetProject)

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
        [switch] $useTargetProject,
        [switch] $showGitOutput,
        [psobject] $repositories
    )

    $i = 0

    foreach ($repository in $repositories) {
        $progress = [math]::floor($i / $repositories.count * 100)

        Write-Progress -Activity "Copying repositories..." -Status "$progress% complete ($($repository.name) - $($repository.size/1000000) MB compressed)" -PercentComplete $progress
        $i++

        Copy-Repository -useTargetProject:$useTargetProject -showGitOutput:$showGitOutput -repository $repository | Out-Null
    }

    Write-Progress -Activity "Copying repositories..." -Completed
}

function Copy-Repository {
    param (
        [switch] $useTargetProject,
        [switch] $showGitOutput,
        [PSObject] $repository
    )

    if ($useTargetProject) {
        $newRepositoryName = $repository.name
    }
    else {
        $newRepositoryName = $repository.name + "_copy"
    }

    try {
        $newRepository = New-Repository -useTargetProject:$useTargetProject -name $newRepositoryName

        $tempLocation = 'temp/repos/' + $repository.name

        if ($showGitOutput) {
            git clone --bare $repository.remoteUrl $tempLocation
        }
        else {
            git clone --bare $repository.remoteUrl $tempLocation --quiet
        }

        Push-Location $tempLocation

        if ($showGitOutput) {
            git push --mirror $newRepository.remoteUrl
        }
        else {
            git push --mirror $newRepository.remoteUrl --quiet
        }

        Pop-Location

        Remove-Item -Recurse -Force $tempLocation

        Write-Host "Copied the repository $($repository.name) ($($repository.size/1000000) MB compressed)."

        return $newRepository
    }
    catch {
        Write-Host "The repository $($repository.name) already exists."
    }

    return $null
}

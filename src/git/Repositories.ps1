# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$gitApiClient = [GitOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

<#
    .SYNOPSIS
        Gets all repositories for the specified project.

    .DESCRIPTION
        Retrieves all project GIT repositories.

        Returns an array with GitRepository objects.

    .PARAMETER useTargetProject
        Indicates whether to use the target project when retrieving the repositories.
        If specified, the target project repositories are returned.

    .OUTPUTS
        System.Array. Returns an array with GitRepository objects.

    .EXAMPLE
        PS> Get-Repositories
        Retrives repositories from the current project.

    .EXAMPLE
        PS> Get-Repositories -useTargetProject
        Retrives repositories from the target project.

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

<#
    .SYNOPSIS
        Gets the repository with the specified id.

    .DESCRIPTION
        Gets the GIT repository with the specified id.

    .PARAMETER useTargetProject
        Indicates whether to use the target project when retrieving the repository.
        If specified, the function retrieves the repository from the target project.

    .PARAMETER id
        The id of the repository to retrive.

    .OUTPUTS
        Returns a GitRepository object.

    .EXAMPLE
        PS> Get-Repository -id '2e2b05c3-1778-4cba-b6ec-c6bf8bd3ba50'
        Gets the repository with the specified id from the current project.

    .EXAMPLE
        PS> Get-Repository -useTargetProject -id '2e2b05c3-1778-4cba-b6ec-c6bf8bd3ba50'
        Gets the repository with the specified id from the target project.

    .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#get-repository
#>
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
        Gets the repository with the specified name.

    .DESCRIPTION
        Gets the GIT repository with the specified name.

    .PARAMETER useTargetProject
        Indicates whether to use the target project when retrieving the repository.
        If specified, the function retrieves the repository from the target project.

    .PARAMETER name
        The name of the repository to retrive.

    .OUTPUTS
        Returns a GitRepository object.

    .EXAMPLE
        PS> Get-Repository -name 'Repository A'
        Gets the repository with the specified name from the current project.

    .EXAMPLE
        PS> Get-Repository -useTargetProject -name 'Repository A'
        Gets the repository with the specified name from the target project.

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

<#
    .SYNOPSIS
        Removes the repository with the specified id.

    .DESCRIPTION
        Removes the repository with the specified id.

    .PARAMETER useTargetProject
        Indicates whether to use the target project when removing the repository.
        If specified, the target project is used.

    .PARAMETER id
        The id of the repository to remove.

    .EXAMPLE
        PS> Remove-Repository -id '2e2b05c3-1778-4cba-b6ec-c6bf8bd3ba50'
        Removes the repository with the specified id from the current project.

    .EXAMPLE
        PS> Remove-Repository -useTargetProject -id '2e2b05c3-1778-4cba-b6ec-c6bf8bd3ba50'
        Removes the repository with the specified id from the target project.

    .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#remove-repository
#>
function Remove-Repository {
    param (
        [switch] $useTargetProject,
        [string] $id
    )

    $gitApiClient.DeleteRepository($useTargetProject, $id)
}

<#
    .SYNOPSIS
        Creates a new GIT repository with the specified name.

    .DESCRIPTION
        Creates a new GIT repository with the specified name.

    .PARAMETER useTargetProject
        Indicates whether to use the target project when creating the repository.
        If specified, the target project is used.

    .PARAMETER useTargetProject
        Name of the new repository.

    .OUTPUTS
        Returns a GitRepository object of the created repository.

    .EXAMPLE
        PS> New-Repository -name 'Repository A'
        Creates a repository in the current project.

    .EXAMPLE
        PS> New-Repository -useTargetProject -name 'Repository A'
        Creates a repository in the the target project.

    .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#new-repository
#>
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

        .PARAMETER useTargetProject
        Indicates whether to use the target project when exporting the repository.
        If specified, the target project is used.

        .PARAMETER outputPath
        Specifies the location of the output file.

        .EXAMPLE
        PS> Export-Repositories
        Export repositories in the current project.

        .EXAMPLE
        PS> Export-Repositories -outputPath 'C:\repositories'
        Export repositories in the current project to the specified location.

        .EXAMPLE
        PS> Export-Repositories -useTargetProject
        Export repositories in the target project.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#export-repositories
    #>
function Export-Repositories {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = ''
    )

    $repositories = Get-Repositories -useTargetProject:$useTargetProject

    if ($repositories.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($repository in $repositories) {
        $name = $repository.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $repository -Depth 100 > "$outputPath\$name.json"
    }
}

<#
        .SYNOPSIS
        Copies all the provided repositories from the current project.

        .DESCRIPTION
        Copies all the provided repositories from the current project.

        .PARAMETER useTargetProject
        Indicates whether to use the target project when copying the repositories.
        If specified, the target project is used for creating copies.

        .PARAMETER showGitOutput
        Indicates whether to show GIT output in the terminal when cloning repositories.

        .PARAMETER repositories
        A list of repositories to copy.

        .EXAMPLE
        PS> Copy-Repositories -repositories $repositories
        Copies the repositories in the current project (appending _copy to the name of the repository).

        .EXAMPLE
        PS> Copy-Repositories -useTargetProject -repositories $repositories
        Copies the repositories from the current project to the target project.

        .EXAMPLE
        PS> Copy-Repositories -showGitOutput -repositories $repositories
        Copies the repositories from the current project to the target project and shows GIT output.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#copy-repositories
    #>
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

<#
        .SYNOPSIS
        Copies the provided repository from the current project.

        .DESCRIPTION
        Copies the provided repository from the current project.

        .PARAMETER useTargetProject
        Indicates whether to use the target project when copying the repository.
        If specified, the target project is used for creating a copy.

        .PARAMETER showGitOutput
        Indicates whether to show GIT output in the terminal when cloning repository.

        .PARAMETER repositories
        A repository to copy.

        .EXAMPLE
        PS> Copy-Repository -repository $repository
        Copies the repository in the current project (appending _copy to the name of the repository).

        .EXAMPLE
        PS> Copy-Repository -useTargetProject -repository $repository
        Copies the repository from the current project to the target project.

        .EXAMPLE
        PS> Copy-Repository -showGitOutput -repository $repository
        Copies the repository from the current project to the target project and shows GIT output.

        .LINK
        Online version: https://github.com/filipliwinski/Azure-DevOps-Toolbox/wiki/Repositories#copy-repository
    #>
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
        Write-Host "An error occured."
        Write-Host $_.Exception.Message
        Write-Host $_.ErrorDetails.Message
    }

    return $null
}

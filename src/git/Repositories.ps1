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
        [string] $repositoryName
    )

    $repository = $gitApiClient.GetRepository($useTargetProject, $repositoryName)

    return $repository
}

function Remove-Repository {
    param (
        [switch] $useTargetProject,
        [string] $repositoryId
    )

    $gitApiClient.DeleteRepository($useTargetProject, $repositoryId)
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

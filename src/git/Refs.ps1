# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

. ".\git\Repositories.ps1"

<#
        .SYNOPSIS
        Gets the branches of the specified repository.

        .DESCRIPTION
        Gets the branches of the specified repository.

        .PARAMETER useTargetProject
        Indicates whether to use the target project.
        If specified, the target project is used.

        .PARAMETER repositoryId
        The identifier of the repository from which the branches are to be retrieved.

        .EXAMPLE
        PS> Get-Refs -repositoryId '2e2b05c3-1778-4cba-b6ec-c6bf8bd3ba50'
        Gets the branches of the specified repository using the current project.

        .EXAMPLE
        PS> Get-Refs -useTargetProject -repositoryId '2e2b05c3-1778-4cba-b6ec-c6bf8bd3ba50'
        Gets the branches of the specified repository using the target project.

        .LINK

    #>
function Get-Refs {
    param(
        [switch] $useTargetProject,
        [string] $repositoryId
    )

    $refs = $gitApiClient.GetRefs($useTargetProject, $repositoryId)
    return $refs.value
}

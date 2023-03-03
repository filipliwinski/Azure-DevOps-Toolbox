# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

. ".\git\Repositories.ps1"

function Get-Refs {
    param(
        [switch] $useTargetProject,
        [string] $repositoryId
    )

    $refs = $apiClient.GetRefs($useTargetProject, $repositoryId)
    return $refs
}

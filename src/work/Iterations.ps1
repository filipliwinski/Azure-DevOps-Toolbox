# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$workApiClient = [WorkOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Get-Iterations {
    param (
        [switch] $useTargetProject,
        [string] $teamName
    )

    $iterations = $workApiClient.GetTeamIterations($useTargetProject, $teamName)
    return $iterations
}
# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$coreApiClient = [CoreOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Get-AllTeams {

  $teams = $coreApiClient.GetAllTeams($null)
  return $teams.value
}

function Get-ProjectTeams {
  param (
    [string] $projectId
)

  $teams = $coreApiClient.GetTeams($null, $projectId)
  return $teams.value
}
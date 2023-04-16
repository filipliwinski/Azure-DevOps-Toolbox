# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$workApiClient = [WorkOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Get-TeamsCapacity {
    param (
        [switch] $useTargetProject,
        [string] $iterationId,
        [string] $teamName
    )

    $capacities = $workApiClient.GetCapacitiesWithIdentityRef($useTargetProject, $iterationId, $teamName)
    return $capacities.value
}

function Get-TotalTeamsCapacity {
  param (
      [switch] $useTargetProject,
      [string] $iterationId,
      [string] $teamName
  )
  
  $capacities = Get-TeamsCapacity -useTargetProject:$useTargetProject -iterationId $iterationId -teamName $teamName
  $totalCapacity = 0
  $numberOfWorkingDays = 5  # TODO: Get number of working days from project's settings

  foreach ($capacity in $capacities) {
    $activities = $capacity.activities

    foreach ($activity in $activities) {
      $totalCapacity += $activity.capacityPerDay * $numberOfWorkingDays
    }
  }

  return $totalCapacity
}

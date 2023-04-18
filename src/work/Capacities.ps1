# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

. .\core\Projects.ps1

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

# non-standard output
function Get-TotalTeamsCapacity {
  param (
      [switch] $useTargetProject,
      [string] $iterationId,
      [string] $teamName
  )
  
  $teamCapacities = Get-TeamsCapacity -useTargetProject:$useTargetProject -iterationId $iterationId -teamName $teamName
  $totalCapacity = 0
  $numberOfWorkingDays = 5  # TODO: Get number of working days from project's settings
  $totalTeamCapacity =  @{}

  foreach ($teamMemberCapacity in $teamCapacities) {
    $activities = $teamMemberCapacity.activities
    $numberOfDaysOff = 0

    foreach ($teamMemberCapacityDaysOff in $teamMemberCapacity.daysOff) {
      $numberOfDaysOff += ($teamMemberCapacityDaysOff.end - $teamMemberCapacityDaysOff.start).TotalDays
    }

    foreach ($activity in $activities) {
      if ('' -eq $activity.name) {
        $activityName = 'Unassigned'
      } else {
        $activityName = $activity.name
      }

      $totalOffHours = $activity.capacityPerDay * $numberOfDaysOff
      $totalCapacity = $activity.capacityPerDay * $numberOfWorkingDays - $totalOffHours

      if ($totalTeamCapacity.ContainsKey($activityName)) {
        $totalTeamCapacity[$activityName].offHours += $totalOffHours
        $totalTeamCapacity[$activityName].capacity += $totalCapacity
      } else {
        $totalTeamCapacity.Add($activityName, @{
          capacity = $totalCapacity
          offHours = $totalOffHours
        })
      }
    }
  }

  return $totalTeamCapacity
}

# non-standard output
function Get-TotalProjectsCapacity {

  $project = Get-CurrentProject
  $teams = Get-ProjectTeams -projectId $project.id

  $teamsCapacities = @{}

  $p_index = 1

  foreach ($team in $teams) {
    $progress = [math]::floor($p_index / $teams.count * 100)
    Write-Progress -Activity "Fetching capacities..." -Status "$progress% Complete [$($team.name)]" -PercentComplete $progress
    $p_index++

    $teamIterations = Get-Iterations -teamName $team.name

    $teamIterationsCollection = [ordered]@{}

    foreach ($iteration in $teamIterations) {

      $teamsCapacity = Get-TotalTeamsCapacity -iterationId $iteration.id -teamName $team.name

      $teamIterationsCollection.add($iteration.name, $teamsCapacity)
    }

    $teamsCapacities.add($team.name, $teamIterationsCollection)
  }
  Write-Progress -Activity "Fetching capacities..." -Completed

  return $teamsCapacities
}
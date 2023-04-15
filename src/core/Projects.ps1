# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$coreApiClient = [CoreOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Get-Projects {

  $projects = $coreApiClient.GetProjects($null)
  return $projects.value
}

function Get-CurrentProject {

  $projects = Get-Projects
  return $projects | Where-Object {$_.name -eq $projectName}
}
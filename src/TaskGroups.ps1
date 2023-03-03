# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$apiClient = [TaskAgentOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Export-TaskGroups {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = ''
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $taskGroups = $apiClient.GetTaskGroups($useTargetProject)

    if ($taskGroups.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($taskGroup in $taskGroups) {
        $name = $taskGroup.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $taskGroup -Depth 100 > "$outputPath\$name.json"
    }
}

# function Update-TaskGroup {
#     param(
#         [string] $sourceTaskGroupName,
#         [string] $destinationTaskGroupName,
#         [string] $comment
#     )

#     $sourceTaskGroup = $apiClient.GetTaskGroupByName($projectName, $sourceTaskGroupName)
#     $destinationTaskGroup = $apiClient.GetTaskGroupByName($projectName, $destinationTaskGroupName)

#     $destinationTaskGroup.description = $sourceTaskGroup.description
#     $destinationTaskGroup.category = $sourceTaskGroup.category
#     $destinationTaskGroup.inputs = $sourceTaskGroup.inputs
#     $destinationTaskGroup.tasks = $sourceTaskGroup.tasks
#     $destinationTaskGroup.comment = $comment

#     $apiClient.UpdateTaskGroup($projectName, $destinationTaskGroup)
# }

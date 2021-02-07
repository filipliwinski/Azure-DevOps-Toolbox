using module ./AzureDevOpsServicesAPIClient.psm1

function Update-TaskGroup {
    param(
        [string] $projectName,
        [string] $sourceTaskGroupName,
        [string] $destinationTaskGroupName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $sourceTaskGroup = $apiClient.GetTaskGroupByName($projectName, $sourceTaskGroupName)
    $destinationTaskGroup = $apiClient.GetTaskGroupByName($projectName, $destinationTaskGroupName)

    $destinationTaskGroup.description = $sourceTaskGroup.description
    $destinationTaskGroup.category = $sourceTaskGroup.category
    $destinationTaskGroup.inputs = $sourceTaskGroup.inputs
    $destinationTaskGroup.tasks = $sourceTaskGroup.tasks

    $apiClient.UpdateTaskGroup($projectName, $destinationTaskGroup)
}

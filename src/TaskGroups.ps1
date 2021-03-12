

function Export-TaskGroups {
    param (
        [string] $projectName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }
    
    $taskGroups = $apiClient.GetTaskGroups($projectName)

    if ($taskGroups.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($taskGroup in $taskGroups) {
        $name = $taskGroup.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $taskGroup -Depth 100 > "$outputPath\$name.json"
    }
}

function Update-TaskGroup {
    param(
        [string] $projectName,
        [string] $sourceTaskGroupName,
        [string] $destinationTaskGroupName,
        [string] $comment,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $sourceTaskGroup = $apiClient.GetTaskGroupByName($projectName, $sourceTaskGroupName)
    $destinationTaskGroup = $apiClient.GetTaskGroupByName($projectName, $destinationTaskGroupName)

    $destinationTaskGroup.description = $sourceTaskGroup.description
    $destinationTaskGroup.category = $sourceTaskGroup.category
    $destinationTaskGroup.inputs = $sourceTaskGroup.inputs
    $destinationTaskGroup.tasks = $sourceTaskGroup.tasks
    $destinationTaskGroup.comment = $comment

    $apiClient.UpdateTaskGroup($projectName, $destinationTaskGroup)
}

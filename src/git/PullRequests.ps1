
function Get-PullRequests {
    param (
        [string] $projectName,
        [string] $status,
        [string] $repositoryId,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    return  $apiClient.GetPullRequestsByRepository($status, $repositoryId, $projectName)
}

function Mirror-PullRequests {
    param (
        [psobject] $pullRequests,
        [string] $destinationProject,
        [string] $destinationRepositoryId,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    
    $pullRequest = $pullRequests.value[0]

    $pullRequestsToCreate = @{
        sourceRefName = $pullRequest.sourceRefName
        targetRefName = $pullRequest.targetRefName
        title = $pullRequest.title
        description = $pullRequest.description
        createdBy = @{
            id = $pullRequest.createdBy.id
          }
    }

    Write-Output $pullRequestsToCreate | ConvertTo-Json 
    Write-Output $destinationRepositoryId
    $result = $apiClient.CreatePullRequest($pullRequestsToCreate, $destinationRepositoryId, $destinationProject)
    Write-Output $result
}
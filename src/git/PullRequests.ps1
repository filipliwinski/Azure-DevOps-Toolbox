
function Get-PullRequests {
    param (
        [string] $projectName,
        [string] $status,
        [string] $repositoryId,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    return  $apiClient.GetPullRequestsByRepository($status, $repositoryId, $projectName)
}

function Import-PullRequests {
    param (
        [psobject] $pullRequests,
        [string] $destinationProject,
        [string] $destinationRepositoryId,
        [AzureDevOpsServicesAPIClient] $apiClient
    )
    
    foreach ($pullRequest in $pullRequests.value) {

        $pullRequestsToCreate = Convert-PullrequestToJson -pullRequest $pullRequest
    
        Write-Output $pullRequestsToCreate | ConvertTo-Json 
        
        $result = $apiClient.CreatePullRequest($pullRequestsToCreate, $destinationRepositoryId, $destinationProject)
        Write-Output $result
    }
}

function Convert-PullrequestToJson {
    param (
        [psobject] $pullRequest
    )

#     Write-Output $pullRequest.createdBy | ConvertTo-Json
#     $reviewers = Get-Reviewers -pullRequest $pullRequest
#     Write-Output $reviewers
#   exit
    $pullRequestsJson = @{
        sourceRefName = $pullRequest.sourceRefName
        targetRefName = $pullRequest.targetRefName
        title = $pullRequest.title
        description = $pullRequest.description
        creationDate = $pullRequest.creationDate
        isDraft = $pullRequest.isDraft
    }

    return  $pullRequestsJson
}

# function Get-Reviewers {
#     param (
#         [psobject] $pullRequest
#     )

#     Write-Output $pullRequest.createdBy | ConvertTo-Json
#     if ($pullRequest.reviewers.count -gt 0) {
#         $reviewers = $pullRequest.reviewers | Select-Object id, uniqueName, displayName, descriptor

#         if($reviewers.count -eq 1){
#             $reviewers = @{
#                 id = $pullRequest.createdBy.id
#                 uniqueName = $pullRequest.createdBy.uniqueName
#                 descriptor = $pullRequest.createdBy.descriptor
#             }
#         }
#         else {
#             $reviewers += @{
#                 id = $pullRequest.createdBy.id
#                 uniqueName = $pullRequest.createdBy.uniqueName
#                 descriptor = $pullRequest.createdBy.descriptor
#             }
#         }
        
#         return  $reviewers | Where-Object displayName -notlike '*NCDPP*' | Select-Object -Unique id, uniqueName, descriptor
#     }

#     return  @(    
#          $pullRequest.createdBy | Select-Object id, uniqueName, descriptor
#     )
# }
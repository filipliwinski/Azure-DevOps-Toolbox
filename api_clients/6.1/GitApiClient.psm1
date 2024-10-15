# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class GitApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.1-preview'

    # GitApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    GitApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Retrieve deleted git repositories.
    [PSObject] GetDeletedRepositories([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "git/deletedrepositories", $this.apiVersion, $null)
    }

    # Creates a ref favorite
    [PSObject] CreateFavorite([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "git/favorites/refs", $this.apiVersion, $body)
    }
     # Gets the refs favorites for a repo and an identity.
    [PSObject] GetRefFavorites([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "git/favorites/refs", $this.apiVersion, $null)
    }

    # Deletes the refs favorite specified
    [PSObject] DeleteRefFavorite([bool] $useTargetProject, [int] $favoriteId) {
        return $this.Request($useTargetProject, 'delete', "git/favorites/refs/$favoriteId", $this.apiVersion, $null)
    }
     # Gets the refs favorite for a favorite Id.
    [PSObject] GetRefFavorite([bool] $useTargetProject, [int] $favoriteId) {
        return $this.Request($useTargetProject, 'get', "git/favorites/refs/$favoriteId", $this.apiVersion, $null)
    }

    # Retrieve a list of policy configurations by a given set of scope/filtering criteria.Below is a short description of how all of the query parameters interact with each other:- repositoryId set, refName set: returns all policy configurations that *apply* to a particular branch in a repository- repositoryId set, refName unset: returns all policy configurations that *apply* to a particular repository- repositoryId unset, refName unset: returns all policy configurations that are *defined* at the project level- repositoryId unset, refName set: returns all project-level branch policies, plus the project level configurationsFor all of the examples above, when policyType is set, it'll restrict results to the given policy type
    [PSObject] GetPolicyConfigurations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "git/policy/configurations", $this.apiVersion, $null)
    }

    # Retrieve all pull requests matching a specified criteria.Please note that description field will be truncated up to 400 symbols in the result.
    [PSObject] GetPullRequestsByProject([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "git/pullrequests", $this.apiVersion, $null)
    }

    # Retrieve a pull request.
    [PSObject] GetPullRequestById([bool] $useTargetProject, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/pullrequests/$pullRequestId", $this.apiVersion, $null)
    }

    # Retrieve soft-deleted git repositories from the recycle bin.
    [PSObject] GetRecycleBinRepositories([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "git/recycleBin/repositories", $this.apiVersion, $null)
    }

    # Destroy (hard delete) a soft-deleted Git repository.
    [PSObject] DeleteRepositoryFromRecycleBin([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'delete', "git/recycleBin/repositories/$repositoryId", $this.apiVersion, $null)
    }
     # Recover a soft-deleted Git repository. Recently deleted repositories go into a soft-delete state for a period of time before they are hard deleted and become unrecoverable.
    [PSObject] RestoreRepositoryFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'patch', "git/recycleBin/repositories/$repositoryId", $this.apiVersion, $body)
    }

    # Create a git repository in a team project.
    [PSObject] CreateRepository([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "git/repositories", $this.apiVersion, $body)
    }
     # Retrieve git repositories.
    [PSObject] GetRepositories([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "git/repositories", $this.apiVersion, $null)
    }

    # Updates the Git repository with either a new repo name or a new default branch.
    [PSObject] UpdateRepository([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId", $this.apiVersion, $body)
    }
     # Retrieve a git repository.
    [PSObject] GetRepository([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId", $this.apiVersion, $null)
    }
     # Delete a git repository
    [PSObject] DeleteRepository([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId", $this.apiVersion, $null)
    }

    # Create an annotated tag.Repositories have both a name and an identifier. Identifiers are globally unique, but several projectsmay contain a repository of the same name. You don't need to include the project if you specify arepository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID).
    [PSObject] CreateAnnotatedTag([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/annotatedtags", $this.apiVersion, $body)
    }

    # Get an annotated tag.Repositories have both a name and an identifier. Identifiers are globally unique, but several projectsmay contain a repository of the same name. You don't need to include the project if you specify arepository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID).
    [PSObject] GetAnnotatedTag([bool] $useTargetProject, [string] $repositoryId, [string] $objectId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/annotatedtags/$objectId", $this.apiVersion, $null)
    }

    # Gets one or more blobs in a zip file download.
    [PSObject] GetBlobs([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/blobs", $this.apiVersion, $body)
    }

    # Get a single blob.Repositories have both a name and an identifier. Identifiers are globally unique,but several projects may contain a repository of the same name. You don't need to includethe project if you specify a repository by ID. However, if you specify a repository by name,you must also specify the project (by name or ID).
    [PSObject] GetBlob([bool] $useTargetProject, [string] $repositoryId, [string] $sha1) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/blobs/$sha1", $this.apiVersion, $null)
    }

    # Cherry pick a specific commit or commits that are associated to a pull request into a new branch.
    [PSObject] CreateCherryPick([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/cherryPicks", $this.apiVersion, $body)
    }
     # Retrieve information about a cherry pick operation for a specific branch. This operation is expensive due to the underlying object structure, so this API only looks at the 1000 most recent cherry pick operations.
    [PSObject] GetCherryPickForRefName([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/cherryPicks", $this.apiVersion, $null)
    }

    # Retrieve information about a cherry pick operation by cherry pick Id.
    [PSObject] GetCherryPick([bool] $useTargetProject, [int] $cherryPickId, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/cherryPicks/$cherryPickId", $this.apiVersion, $null)
    }

    # Retrieve a list of commits associated with a particular push.
    [PSObject] GetPushCommits([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/commits", $this.apiVersion, $null)
    }

    # Retrieve a particular commit.
    [PSObject] GetCommit([bool] $useTargetProject, [string] $commitId, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/commits/$commitId", $this.apiVersion, $null)
    }

    # Retrieve changes for a particular commit.
    [PSObject] GetChanges([bool] $useTargetProject, [string] $commitId, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/commits/$commitId/changes", $this.apiVersion, $null)
    }

    # Create Git commit status.
    [PSObject] CreateCommitStatus([bool] $useTargetProject, [PSObject] $body, [string] $commitId, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/commits/$commitId/statuses", $this.apiVersion, $body)
    }
     # Get statuses associated with the Git commit.
    [PSObject] GetStatuses([bool] $useTargetProject, [string] $commitId, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/commits/$commitId/statuses", $this.apiVersion, $null)
    }

    # Retrieve git commits for a project matching the search criteria
    [PSObject] GetCommitsBatch([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/commitsbatch", $this.apiVersion, $body)
    }

    # Find the closest common commit (the merge base) between base and target commits, and get the diff between either the base and target commits or common and target commits.
    [PSObject] GetCommitDiffs([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/diffs/commits", $this.apiVersion, $null)
    }

    # Create an import request.
    [PSObject] CreateImportRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/importRequests", $this.apiVersion, $body)
    }
     # Retrieve import requests for a repository.
    [PSObject] QueryImportRequests([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/importRequests", $this.apiVersion, $null)
    }

    # Retrieve a particular import request.
    [PSObject] GetImportRequest([bool] $useTargetProject, [string] $repositoryId, [int] $importRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/importRequests/$importRequestId", $this.apiVersion, $null)
    }
     # Retry or abandon a failed import request.There can only be one active import request associated with a repository. Marking a failed import request abandoned makes it inactive.
    [PSObject] UpdateImportRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $importRequestId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/importRequests/$importRequestId", $this.apiVersion, $body)
    }

    # Get Item Metadata and/or Content for a collection of items. The download parameter is to indicate whether the content should be available as a download or just sent as a stream in the response. Doesn't apply to zipped content which is always returned as a download.
    [PSObject] GetItems([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/items", $this.apiVersion, $null)
    }

    # Post for retrieving a creating a batch out of a set of items in a repo / project given a list of paths or a long path
    [PSObject] GetItemsBatch([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/itemsbatch", $this.apiVersion, $body)
    }

    # This API is used to find what pull requests are related to a given commit.  It can be used to either find the pull request that created a particular merge commit or it can be used to find all pull requests that have ever merged a particular commit.  The input is a list of queries which each contain a list of commits. For each commit that you search against, you will get back a dictionary of commit -> pull requests.
    [PSObject] GetPullRequestQuery([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullrequestquery", $this.apiVersion, $body)
    }

    # Create a pull request.
    [PSObject] CreatePullRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullrequests", $this.apiVersion, $body)
    }
     # Retrieve all pull requests matching a specified criteria.Please note that description field will be truncated up to 400 symbols in the result.
    [PSObject] GetPullRequests([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullrequests", $this.apiVersion, $null)
    }

    # Retrieve a pull request.
    [PSObject] GetPullRequest([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullrequests/$pullRequestId", $this.apiVersion, $null)
    }
     # Update a pull requestThese are the properties that can be updated with the API: - Status - Title - Description (up to 4000 characters) - CompletionOptions - MergeOptions - AutoCompleteSetBy.Id - TargetRefName (when the PR retargeting feature is enabled) Attempting to update other properties outside of this list will either cause the server to throw an `InvalidArgumentValueException`, or to silently ignore the update.
    [PSObject] UpdatePullRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullrequests/$pullRequestId", $this.apiVersion, $body)
    }

    # Get a list of files attached to a given pull request.
    [PSObject] GetAttachments([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/attachments", $this.apiVersion, $null)
    }

    # Get the file content of a pull request attachment.
    [PSObject] GetAttachment([bool] $useTargetProject, [string] $fileName, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/attachments/$fileName", $this.apiVersion, $null)
    }
     # Delete a pull request attachment.
    [PSObject] DeleteAttachment([bool] $useTargetProject, [string] $fileName, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/attachments/$fileName", $this.apiVersion, $null)
    }
     # Attach a new file to a pull request.
    [PSObject] CreateAttachment([bool] $useTargetProject, [PSObject] $body, [string] $fileName, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/attachments/$fileName", $this.apiVersion, $body)
    }

    # Get the commits for the specified pull request.
    [PSObject] GetPullRequestCommits([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/commits", $this.apiVersion, $null)
    }

    # Get the list of iterations for the specified pull request.
    [PSObject] GetPullRequestIterations([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations", $this.apiVersion, $null)
    }

    # Get the specified iteration for a pull request.
    [PSObject] GetPullRequestIteration([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId", $this.apiVersion, $null)
    }

    # Retrieve the changes made in a pull request between two iterations.
    [PSObject] GetPullRequestIterationChanges([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/changes", $this.apiVersion, $null)
    }

    # Get the commits for the specified iteration of a pull request.
    [PSObject] GetPullRequestIterationCommits([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/commits", $this.apiVersion, $null)
    }

    # Update pull request iteration statuses collection. The only supported operation type is `remove`.This operation allows to delete multiple statuses in one call.The path of the `remove` operation should refer to the ID of the pull request status.For example `path="/1"` refers to the pull request status with ID 1.
    [PSObject] UpdatePullRequestIterationStatuses([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/statuses", $this.apiVersion, $body)
    }
     # Get all the statuses associated with a pull request iteration.
    [PSObject] GetPullRequestIterationStatuses([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/statuses", $this.apiVersion, $null)
    }
     # Create a pull request status on the iteration. This operation will have the same result as Create status on pull request with specified iteration ID in the request body.The only required field for the status is `Context.Name` that uniquely identifies the status.Note that `iterationId` in the request body is optional since `iterationId` can be specified in the URL.A conflict between `iterationId` in the URL and `iterationId` in the request body will result in status code 400.
    [PSObject] CreatePullRequestIterationStatus([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/statuses", $this.apiVersion, $body)
    }

    # Delete pull request iteration status.You can remove multiple statuses in one call by using Update operation.
    [PSObject] DeletePullRequestIterationStatus([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId, [int] $statusId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/statuses/$statusId", $this.apiVersion, $null)
    }
     # Get the specific pull request iteration status by ID. The status ID is unique within the pull request across all iterations.
    [PSObject] GetPullRequestIterationStatus([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $iterationId, [int] $statusId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/iterations/$iterationId/statuses/$statusId", $this.apiVersion, $null)
    }

    # Create a label for a specified pull request. The only required field is the name of the new label.
    [PSObject] CreatePullRequestLabel([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/labels", $this.apiVersion, $body)
    }
     # Get all the labels assigned to a pull request.
    [PSObject] GetPullRequestLabels([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/labels", $this.apiVersion, $null)
    }

    # Removes a label from the set of those assigned to the pull request.
    [PSObject] DeletePullRequestLabels([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [string] $labelIdOrName) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/labels/$labelIdOrName", $this.apiVersion, $null)
    }
     # Retrieves a single label that has been assigned to a pull request.
    [PSObject] GetPullRequestLabel([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [string] $labelIdOrName) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/labels/$labelIdOrName", $this.apiVersion, $null)
    }

    # Get external properties of the pull request.
    [PSObject] GetPullRequestProperties([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/properties", $this.apiVersion, $null)
    }
     # Create or update pull request external properties. The patch operation can be `add`, `replace` or `remove`. For `add` operation, the path can be empty. If the path is empty, the value must be a list of key value pairs. For `replace` operation, the path cannot be empty. If the path does not exist, the property will be added to the collection. For `remove` operation, the path cannot be empty. If the path does not exist, no action will be performed.
    [PSObject] UpdatePullRequestProperties([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/properties", $this.apiVersion, $body)
    }

    # Retrieve the reviewers for a pull request
    [PSObject] GetPullRequestReviewers([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers", $this.apiVersion, $null)
    }
     # Reset the votes of multiple reviewers on a pull request.  NOTE: This endpoint only supports updating votes, but does not support updating required reviewers (use policy) or display names.
    [PSObject] UpdatePullRequestReviewers([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers", $this.apiVersion, $body)
    }
     # Add an unmaterialized identity to the reviewers of a pull request.
    [PSObject] CreateUnmaterializedPullRequestReviewer([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'put', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers", $this.apiVersion, $body)
    }
     # Add reviewers to a pull request.
    [PSObject] CreatePullRequestReviewers([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers", $this.apiVersion, $body)
    }

    # Retrieve information about a particular reviewer on a pull request
    [PSObject] GetPullRequestReviewer([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [string] $reviewerId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers/$reviewerId", $this.apiVersion, $null)
    }
     # Edit a reviewer entry. These fields are patchable: isFlagged, hasDeclined
    [PSObject] UpdatePullRequestReviewer([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [string] $reviewerId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers/$reviewerId", $this.apiVersion, $body)
    }
     # Remove a reviewer from a pull request.
    [PSObject] DeletePullRequestReviewer([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [string] $reviewerId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers/$reviewerId", $this.apiVersion, $null)
    }
     # Add a reviewer to a pull request or cast a vote.
    [PSObject] CreatePullRequestReviewer([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [string] $reviewerId) {
        return $this.Request($useTargetProject, 'put', "git/repositories/$repositoryId/pullRequests/$pullRequestId/reviewers/$reviewerId", $this.apiVersion, $body)
    }

    # Sends an e-mail notification about a specific pull request to a set of recipients
    [PSObject] SharePullRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/share", $this.apiVersion, $body)
    }

    # Update pull request statuses collection. The only supported operation type is `remove`.This operation allows to delete multiple statuses in one call.The path of the `remove` operation should refer to the ID of the pull request status.For example `path="/1"` refers to the pull request status with ID 1.
    [PSObject] UpdatePullRequestStatuses([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/statuses", $this.apiVersion, $body)
    }
     # Get all the statuses associated with a pull request.
    [PSObject] GetPullRequestStatuses([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/statuses", $this.apiVersion, $null)
    }
     # Create a pull request status.The only required field for the status is `Context.Name` that uniquely identifies the status.Note that you can specify iterationId in the request body to post the status on the iteration.
    [PSObject] CreatePullRequestStatus([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/statuses", $this.apiVersion, $body)
    }

    # Delete pull request status.You can remove multiple statuses in one call by using Update operation.
    [PSObject] DeletePullRequestStatus([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $statusId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/statuses/$statusId", $this.apiVersion, $null)
    }
     # Get the specific pull request status by ID. The status ID is unique within the pull request across all iterations.
    [PSObject] GetPullRequestStatus([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $statusId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/statuses/$statusId", $this.apiVersion, $null)
    }

    # Create a thread in a pull request.
    [PSObject] CreateThread([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads", $this.apiVersion, $body)
    }
     # Retrieve all threads in a pull request.
    [PSObject] GetThreads([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads", $this.apiVersion, $null)
    }

    # Retrieve a thread in a pull request.
    [PSObject] GetPullRequestThread([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId", $this.apiVersion, $null)
    }
     # Update a thread in a pull request.
    [PSObject] UpdateThread([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [int] $threadId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId", $this.apiVersion, $body)
    }

    # Create a comment on a specific thread in a pull request (up to 500 comments can be created per thread).
    [PSObject] CreateComment([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [int] $threadId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments", $this.apiVersion, $body)
    }
     # Retrieve all comments associated with a specific thread in a pull request.
    [PSObject] GetComments([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments", $this.apiVersion, $null)
    }

    # Update a comment associated with a specific thread in a pull request.
    [PSObject] UpdateComment([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId, [int] $pullRequestId, [int] $threadId, [int] $commentId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments/$commentId", $this.apiVersion, $body)
    }
     # Retrieve a comment associated with a specific thread in a pull request.
    [PSObject] GetComment([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId, [int] $commentId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments/$commentId", $this.apiVersion, $null)
    }
     # Delete a comment associated with a specific thread in a pull request.
    [PSObject] DeleteComment([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId, [int] $commentId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments/$commentId", $this.apiVersion, $null)
    }

    # Get likes for a comment.
    [PSObject] GetLikes([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId, [int] $commentId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments/$commentId/likes", $this.apiVersion, $null)
    }
     # Delete a like on a comment.
    [PSObject] DeleteLike([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId, [int] $commentId) {
        return $this.Request($useTargetProject, 'delete', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments/$commentId/likes", $this.apiVersion, $null)
    }
     # Add a like on a comment.
    [PSObject] CreateLike([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId, [int] $threadId, [int] $commentId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pullRequests/$pullRequestId/threads/$threadId/comments/$commentId/likes", $this.apiVersion, $null)
    }

    # Retrieve a list of work items associated with a pull request.
    [PSObject] GetPullRequestWorkItemRefs([bool] $useTargetProject, [string] $repositoryId, [int] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pullRequests/$pullRequestId/workitems", $this.apiVersion, $null)
    }

    # Push changes to the repository.
    [PSObject] CreatePush([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/pushes", $this.apiVersion, $body)
    }
     # Retrieves pushes associated with the specified repository.
    [PSObject] GetPushes([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pushes", $this.apiVersion, $null)
    }

    # Retrieves a particular push.
    [PSObject] GetPush([bool] $useTargetProject, [string] $repositoryId, [int] $pushId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/pushes/$pushId", $this.apiVersion, $null)
    }

    # Creating, updating, or deleting refs(branches).Updating a ref means making it point at a different commit than it used to. You must specify both the old and new commit to avoid race conditions.
    [PSObject] UpdateRefs([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/refs", $this.apiVersion, $body)
    }
     # Lock or Unlock a branch.
    [PSObject] UpdateRef([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'patch', "git/repositories/$repositoryId/refs", $this.apiVersion, $body)
    }
     # Queries the provided repository for its refs and returns them.
    [PSObject] GetRefs([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/refs", $this.apiVersion, $null)
    }

    # Starts the operation to create a new branch which reverts changes introduced by either a specific commit or commits that are associated to a pull request.
    [PSObject] CreateRevert([bool] $useTargetProject, [PSObject] $body, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryId/reverts", $this.apiVersion, $body)
    }
     # Retrieve information about a revert operation for a specific branch.
    [PSObject] GetRevertForRefName([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/reverts", $this.apiVersion, $null)
    }

    # Retrieve information about a revert operation by revert Id.
    [PSObject] GetRevert([bool] $useTargetProject, [int] $revertId, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/reverts/$revertId", $this.apiVersion, $null)
    }

    # Retrieve statistics about all branches within a repository.
    [PSObject] GetBranches([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/stats/branches", $this.apiVersion, $null)
    }

    # Retrieve a pull request suggestion for a particular repository or team project.
    [PSObject] GetSuggestions([bool] $useTargetProject, [string] $repositoryId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/suggestions", $this.apiVersion, $null)
    }

    # The Tree endpoint returns the collection of objects underneath the specified tree. Trees are folders in a Git repository.Repositories have both a name and an identifier. Identifiers are globally unique, but several projects may contain a repository of the same name. You don't need to include the project if you specify a repository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID.
    [PSObject] GetTree([bool] $useTargetProject, [string] $repositoryId, [string] $sha1) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryId/trees/$sha1", $this.apiVersion, $null)
    }

    # Find the merge bases of two commits, optionally across forks. If otherRepositoryId is not specified, the merge bases will only be calculated within the context of the local repositoryNameOrId.
    [PSObject] GetMergeBases([bool] $useTargetProject, [string] $repositoryNameOrId, [string] $commitId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryNameOrId/commits/$commitId/mergebases", $this.apiVersion, $null)
    }

    # Retrieve all forks of a repository in the collection.
    [PSObject] GetForks([bool] $useTargetProject, [string] $repositoryNameOrId, [string] $collectionId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryNameOrId/forks/Id", $this.apiVersion, $null)
    }

    # Request that another repository's refs be fetched into this one. It syncs two existing forks. To create a fork, please see the <a href="https://docs.microsoft.com/en-us/rest/api/vsts/git/repositories/create?view=azure-devops-rest-5.1"> repositories endpoint</a>
    [PSObject] CreateForkSyncRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryNameOrId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryNameOrId/forkSyncRequests", $this.apiVersion, $body)
    }
     # Retrieve all requested fork sync operations on this repository.
    [PSObject] GetForkSyncRequests([bool] $useTargetProject, [string] $repositoryNameOrId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryNameOrId/forkSyncRequests", $this.apiVersion, $null)
    }

    # Get a specific fork sync operation's details.
    [PSObject] GetForkSyncRequest([bool] $useTargetProject, [string] $repositoryNameOrId, [int] $forkSyncOperationId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryNameOrId/forkSyncRequests/$forkSyncOperationId", $this.apiVersion, $null)
    }

    # Request a git merge operation. Currently we support merging only 2 commits.
    [PSObject] CreateMergeRequest([bool] $useTargetProject, [PSObject] $body, [string] $repositoryNameOrId) {
        return $this.Request($useTargetProject, 'post', "git/repositories/$repositoryNameOrId/merges", $this.apiVersion, $body)
    }

    # Get a specific merge operation's details.
    [PSObject] GetMergeRequest([bool] $useTargetProject, [string] $repositoryNameOrId, [int] $mergeOperationId) {
        return $this.Request($useTargetProject, 'get', "git/repositories/$repositoryNameOrId/merges/$mergeOperationId", $this.apiVersion, $null)
    }

}


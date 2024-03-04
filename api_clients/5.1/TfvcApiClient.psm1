# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class TfvcApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1'

    # TfvcApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TfvcApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Retrieve Tfvc changes for a given changeset.
    [PSObject] GetChangesetChanges([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "tfvc/changesets/$id/changes", $this.apiVersion, $null)
    }

    # Retrieves the work items associated with a particular changeset.
    [PSObject] GetChangesetWorkItems([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "tfvc/changesets/$id/workItems", $this.apiVersion, $null)
    }

    # Returns changesets for a given list of changeset Ids.
    [PSObject] GetBatchedChangesets([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tfvc/changesetsbatch", $this.apiVersion, $body)
    }

    # Get items under a label.
    [PSObject] GetLabelItems([bool] $useTargetProject, [string] $labelId) {
        return $this.Request($useTargetProject, 'get', "tfvc/labels/$labelId/items", $this.apiVersion, $null)
    }

    # Get a single deep shelveset.
    [PSObject] GetShelveset([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/shelvesets", $this.apiVersion, $null)
    }

    # Get changes included in a shelveset.
    [PSObject] GetShelvesetChanges([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/shelvesets/changes", $this.apiVersion, $null)
    }

    # Get work items associated with a shelveset.
    [PSObject] GetShelvesetWorkItems([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/shelvesets/workitems", $this.apiVersion, $null)
    }

    # Get branch hierarchies below the specified scopePath
    [PSObject] GetBranchRefs([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/branches", $this.apiVersion, $null)
    }

    # Create a new changeset.Accepts TfvcChangeset as JSON body
    [PSObject] CreateChangeset([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tfvc/changesets", $this.apiVersion, $body)
    }
     # Retrieve Tfvc ChangesetsNote: This is a new version of the GetChangesets API that doesn't expose the unneeded queryParamspresent in the 1.0 version of the API.
    [PSObject] GetChangesets([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/changesets", $this.apiVersion, $null)
    }

    # Retrieve a Tfvc Changeset
    [PSObject] GetChangeset([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "tfvc/changesets/$id", $this.apiVersion, $null)
    }

    # Post for retrieving a set of items given a list of paths or a long path. Allows for specifying the recursionLevel and version descriptors for each path.
    [PSObject] GetItemsBatch([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tfvc/itembatch", $this.apiVersion, $body)
    }

    # Get a list of Tfvc items
    [PSObject] GetItems([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/items", $this.apiVersion, $null)
    }

    # Get a collection of shallow label references.
    [PSObject] GetLabels([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tfvc/labels", $this.apiVersion, $null)
    }

    # Get a single deep label.
    [PSObject] GetLabel([bool] $useTargetProject, [string] $labelId) {
        return $this.Request($useTargetProject, 'get', "tfvc/labels/$labelId", $this.apiVersion, $null)
    }

}


# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class AlertApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # AlertApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    AlertApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get alerts for a repository
    [PSObject] GetAlertsAsync([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/alerts", $this.apiVersion, $null)
    }

    # Update the status of an alert
    [PSObject] UpdateAlertAsync([bool] $useTargetProject, [PSObject] $body, [int] $alertId, [string] $repository) {
        return $this.Request($useTargetProject, 'patch', "alert/repositories/$repository/alerts/$alertId", $this.apiVersion, $body)
    }
     # Get an alert.
    [PSObject] GetAlertAsync([bool] $useTargetProject, [int] $alertId, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/alerts/$alertId", $this.apiVersion, $null)
    }

    # Get instances of an alert on a branch specified with @ref. If @ref is not provided, return instances of an alert on default branch(if the alert exist in default branch) or latest affected branch.
    [PSObject] GetAlertInstancesAsync([bool] $useTargetProject, [int] $alertId, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/alerts/$alertId/instances", $this.apiVersion, $null)
    }

    # Get an alert metadata.
    [PSObject] GetAlertMetadataAsync([bool] $useTargetProject, [int] $alertId, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/alerts/$alertId/metadata", $this.apiVersion, $null)
    }

    # Get alerts metadata.
    [PSObject] GetAlertMetadataBatchAsync([bool] $useTargetProject, [PSObject] $body, [string] $repository) {
        return $this.Request($useTargetProject, 'post', "alert/repositories/$repository/alerts/metadatabatch", $this.apiVersion, $body)
    }

    # Get alerts by alert IDs Currently supports fetching secret alerts only.
    [PSObject] GetAlertsByIdsAsync([bool] $useTargetProject, [PSObject] $body, [string] $repository) {
        return $this.Request($useTargetProject, 'post', "alert/repositories/$repository/AlertsBatch", $this.apiVersion, $body)
    }

    # Returns the branches for which analysis results were submitted.
    [PSObject] GetBranchesAsync([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/filters/branches", $this.apiVersion, $null)
    }

    # Soft-deletes analysis data for all pipelines in a repository, cleaning up the associated Advanced Security alerts.
    [PSObject] DeleteAllPipelineAnalysesAsync([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'delete', "alert/repositories/$repository/pipelineAnalyses", $this.apiVersion, $null)
    }

    # Soft-deletes analysis data for a specific pipeline, cleaning up the associated Advanced Security alerts.
    [PSObject] DeletePipelineAnalysisAsync([bool] $useTargetProject, [string] $repository, [int] $adoPipelineId) {
        return $this.Request($useTargetProject, 'delete', "alert/repositories/$repository/pipelineAnalysis/$adoPipelineId", $this.apiVersion, $null)
    }

}


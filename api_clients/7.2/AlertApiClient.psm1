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

    # Get instances of an alert.
    [PSObject] GetAlertInstancesAsync([bool] $useTargetProject, [int] $alertId, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/alerts/$alertId/instances", $this.apiVersion, $null)
    }

    # Returns the branches for which analysis results were submitted.
    [PSObject] GetBranchesAsync([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "alert/repositories/$repository/filters/branches", $this.apiVersion, $null)
    }

}


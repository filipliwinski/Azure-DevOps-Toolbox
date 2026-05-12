# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class AdvancedSecurity.ReportingApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # AdvancedSecurity.ReportingApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    AdvancedSecurity.ReportingApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Gets all advanced filters for the organization.
    [PSObject] ListAdvancedFilters([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "reporting/filtersSettings/alertsbatch", $this.apiVersion, $null)
    }
     # Creates a new advanced filter for the organization.
    [PSObject] CreateAdvancedFilter([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "reporting/filtersSettings/alertsbatch", $this.apiVersion, $body)
    }

    # Gets a specific advanced filter by its ID.
    [PSObject] GetAdvancedFilter([bool] $useTargetProject, [string] $filterId) {
        return $this.Request($useTargetProject, 'get', "reporting/filtersSettings/alertsbatch/$filterId", $this.apiVersion, $null)
    }
     # Deletes an advanced filter.
    [PSObject] DeleteAdvancedFilter([bool] $useTargetProject, [string] $filterId) {
        return $this.Request($useTargetProject, 'delete', "reporting/filtersSettings/alertsbatch/$filterId", $this.apiVersion, $null)
    }
     # Updates an advanced filter. Only the name can be updated.
    [PSObject] UpdateAdvancedFilter([bool] $useTargetProject, [PSObject] $body, [string] $filterId) {
        return $this.Request($useTargetProject, 'patch', "reporting/filtersSettings/alertsbatch/$filterId", $this.apiVersion, $body)
    }

    # Get Alert summary by severity for the org
    [PSObject] GetAlertSummaryForOrg([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "reporting/summary/alerts", $this.apiVersion, $null)
    }

    # Get Combined Alerts for the org
    [PSObject] GetCombinedAlertsForOrg([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "reporting/summary/alertsbatch", $this.apiVersion, $null)
    }

    # Get Enablement summary for the org
    [PSObject] GetEnablementSummaryForOrg([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "reporting/summary/enablement", $this.apiVersion, $null)
    }

}


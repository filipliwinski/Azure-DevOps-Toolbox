# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class AdvancedSecurity.ReportingApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # AdvancedSecurity.ReportingApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    AdvancedSecurity.ReportingApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get Alert summary by severity for the org
    [PSObject] getAlertSummaryForOrg([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "reporting/summary/alerts", $this.apiVersion, $null)
    }

    # empty
    [PSObject] getEnablementSummaryForOrg([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "reporting/summary/enablement", $this.apiVersion, $null)
    }

}


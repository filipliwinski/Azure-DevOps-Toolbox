# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class AuditApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1-preview'

    # AuditApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    AuditApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Queries audit log entries
    [PSObject] QueryLog([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "audit/auditlog", $this.apiVersion, $null)
    }

    # Downloads audit log entries.
    [PSObject] DownloadLog([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "audit/downloadlog", $this.apiVersion, $null)
    }

}


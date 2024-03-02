# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class StatusApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0-preview'

    # StatusApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    StatusApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Queries status information for the service all-up, or scoped to a particular service and/or geography
    [PSObject] GetServiceStatus([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "status/health", $this.apiVersion, $null)
    }

}


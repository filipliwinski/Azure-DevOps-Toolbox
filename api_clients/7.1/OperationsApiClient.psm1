# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class OperationsApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

    # OperationsApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    OperationsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Gets an operation from the operationId using the given pluginId.Some scenarios don’t require a pluginId. If a pluginId is not included in the call then just the operationId will be used to find an operation.
    [PSObject] GetOperation([bool] $useTargetProject, [string] $operationId) {
        return $this.Request($useTargetProject, 'get', "operations/$operationId", $this.apiVersion, $null)
    }

}


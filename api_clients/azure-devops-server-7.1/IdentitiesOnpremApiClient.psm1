# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class IdentitiesOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1'

    # IdentitiesOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    IdentitiesOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Resolve legacy identity information for use with older APIs such as the Security APIs
    [PSObject] ReadIdentities([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "identities", $this.apiVersion, $null)
    }

}


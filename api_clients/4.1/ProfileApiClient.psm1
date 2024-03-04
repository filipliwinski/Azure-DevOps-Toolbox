# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class ProfileApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '4.1'

    # ProfileApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ProfileApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get my profile.
    [PSObject] GetProfile([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "profile/profiles/$id", $this.apiVersion, $null)
    }

}


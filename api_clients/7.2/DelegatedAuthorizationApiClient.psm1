# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class DelegatedAuthorizationApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # DelegatedAuthorizationApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    DelegatedAuthorizationApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get one of the two secrets for the ADO OAuth App Registration
    [PSObject] GetSecret([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'get', "delegatedauth/registrationsecret/$registrationId", $this.apiVersion, $null)
    }
     # Create Alternative Secret for the ADO OAuth App Registration
    [PSObject] CreateAlternativeSecret([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'post', "delegatedauth/registrationsecret/$registrationId", $this.apiVersion, $null)
    }
     # Rotate one of the two secrets for the ADO OAuth App Registration
    [PSObject] RotateSecret([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'put', "delegatedauth/registrationsecret/$registrationId", $this.apiVersion, $null)
    }

}


# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class DelegatedAuthorizationApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # DelegatedAuthorizationApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    DelegatedAuthorizationApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # empty
    [PSObject] RevokeAuthorization([bool] $useTargetProject, [string] $userId) {
        return $this.Request($useTargetProject, 'post', "delegatedauth/authorizations/$userId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] GetAuthorizations([bool] $useTargetProject, [string] $userId) {
        return $this.Request($useTargetProject, 'get', "delegatedauth/authorizations/$userId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] AuthorizeHost([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'post', "delegatedauth/hostauthorization", $this.apiVersion, $null)
    }
     # empty
    [PSObject] GetHostAuthorizations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "delegatedauth/hostauthorization", $this.apiVersion, $null)
    }
     # empty
    [PSObject] RevokeHostAuthorization([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "delegatedauth/hostauthorization", $this.apiVersion, $null)
    }

    # empty
    [PSObject] CreateRegistration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'put', "delegatedauth/registration", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetRegistrations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "delegatedauth/registration", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateRegistration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "delegatedauth/registration", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetRegistration([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'get', "delegatedauth/registration/$registrationId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] DeleteRegistration([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'delete', "delegatedauth/registration/$registrationId", $this.apiVersion, $null)
    }

    # Create Alternative Secret for the ADO OAuth App Registration
    [PSObject] CreateAlternativeSecret([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'post', "delegatedauth/registrationsecret/$registrationId", $this.apiVersion, $null)
    }
     # Get one of the two secrets for the ADO OAuth App Registration
    [PSObject] GetSecret([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'get', "delegatedauth/registrationsecret/$registrationId", $this.apiVersion, $null)
    }
     # Rotate one of the two secrets for the ADO OAuth App Registration
    [PSObject] RotateSecret([bool] $useTargetProject, [string] $registrationId) {
        return $this.Request($useTargetProject, 'put', "delegatedauth/registrationsecret/$registrationId", $this.apiVersion, $null)
    }

}


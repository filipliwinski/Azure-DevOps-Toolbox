# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TokenAdministrationApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0-preview'

    # TokenAdministrationApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TokenAdministrationApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Revokes the listed OAuth authorizations.
    [PSObject] ListIdentitiesWithGlobalAccessTokens([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tokenadministration/tokenlistglobalidentities", $this.apiVersion, $body)
    }

    # Lists of all the session token details of the personal access tokens (PATs) for a particular user.
    [PSObject] ListPersonalAccessTokens([bool] $useTargetProject, [PSObject] $body, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'post', "tokenadministration/tokenpersonalaccesstokens/$subjectDescriptor", $this.apiVersion, $body)
    }

    # Revokes the listed OAuth authorizations.
    [PSObject] RevokeAuthorizations([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tokenadministration/tokenrevocations", $this.apiVersion, $body)
    }

}


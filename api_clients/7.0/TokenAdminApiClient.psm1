# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class TokenAdminApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0'

    # TokenAdminApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TokenAdminApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Lists of all the session token details of the personal access tokens (PATs) for a particular user.
    [PSObject] ListPersonalAccessTokens([bool] $useTargetProject, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'get', "tokenadmin/personalaccesstokens/$subjectDescriptor", $this.apiVersion, $null)
    }

    # Creates a revocation rule to prevent the further usage of any OAuth authorizations that were created before the current point in time and which match the conditions in the rule.Not all kinds of OAuth authorizations can be revoked directly.Some, such as self-describing session tokens, must instead by revoked by creating a rulewhich will be evaluated and used to reject matching OAuth credentials at authentication time.Revocation rules created through this endpoint will apply to all credentials that were issuedbefore the datetime at which the rule was created and which match one or more additional conditions.
    [PSObject] CreateRevocationRule([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tokenadmin/revocationrules", $this.apiVersion, $body)
    }

    # Revokes the listed OAuth authorizations.
    [PSObject] RevokeAuthorizations([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tokenadmin/revocations", $this.apiVersion, $body)
    }

}


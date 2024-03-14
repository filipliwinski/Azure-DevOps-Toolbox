# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TokensApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0-preview'

    # TokensApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TokensApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Revokes a personal access token (PAT) by authorizationId.
    [PSObject] Revoke([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "tokens/pats", $this.apiVersion, $null)
    }
     # Gets a single personal access token (PAT).
    [PSObject] GetPat([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "tokens/pats", $this.apiVersion, $null)
    }
     # Creates a new personal access token (PAT) for the requesting user.
    [PSObject] CreatePat([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "tokens/pats", $this.apiVersion, $body)
    }
     # Updates an existing personal access token (PAT) with the new parameters. To update a token, it must be valid (has not been revoked).
    [PSObject] UpdatePat([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'put', "tokens/pats", $this.apiVersion, $body)
    }

}


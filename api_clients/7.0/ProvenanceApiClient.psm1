# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class ProvenanceApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0-preview'

    # ProvenanceApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ProvenanceApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Creates a session, a wrapper around a feed that can store additional metadata on the packages published to it.
    [PSObject] CreateSession([bool] $useTargetProject, [PSObject] $body, [string] $protocol) {
        return $this.Request($useTargetProject, 'post', "provenance/session/$protocol", $this.apiVersion, $body)
    }

}


# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class DynamicPipelinesApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # DynamicPipelinesApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    DynamicPipelinesApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

}


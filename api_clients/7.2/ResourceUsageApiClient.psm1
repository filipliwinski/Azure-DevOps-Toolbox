# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class ResourceUsageApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

    # ResourceUsageApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ResourceUsageApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # empty
    [PSObject] GetLimits([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "resourceusage", $this.apiVersion, $null)
    }

    # Gets the Project Level limits and Usage for a project.
    [PSObject] GetProjectLimit([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "resourceusage", $this.apiVersion, $null)
    }

}


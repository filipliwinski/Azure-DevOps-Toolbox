# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class PermissionsReportApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0'

    # PermissionsReportApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PermissionsReportApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of permissions reports
    [PSObject] GetPermissionsReports([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "permissionsreport", $this.apiVersion, $null)
    }
     # Request a permissions report to be created asyncronously
    [PSObject] CreatePermissionsReport([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "permissionsreport", $this.apiVersion, $body)
    }

    # Get a specific permissions report
    [PSObject] GetPermissionsReport([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "permissionsreport/$id", $this.apiVersion, $null)
    }

    # Download the json results of a permissions report
    [PSObject] Download([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "permissionsreport/$id/download", $this.apiVersion, $null)
    }

}


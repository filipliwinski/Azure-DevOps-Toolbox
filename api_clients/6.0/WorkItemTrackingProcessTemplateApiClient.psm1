# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class WorkItemTrackingProcessTemplateApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0-preview'

    # WorkItemTrackingProcessTemplateApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WorkItemTrackingProcessTemplateApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Returns a list of behaviors for the process.
    [PSObject] GetBehaviors([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processadmin/$processId/behaviors", $this.apiVersion, $null)
    }

    # Returns requested process template.
    [PSObject] Export([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "work/processadmin/processes/export/$id", $this.apiVersion, $null)
    }

    # Imports a process from zip file.
    [PSObject] Import([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "work/processadmin/processes/import", $this.apiVersion, $body)
    }

    # Tells whether promote has completed for the specified promote job ID.
    [PSObject] Status([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "work/processadmin/processes/status/$id", $this.apiVersion, $null)
    }

}


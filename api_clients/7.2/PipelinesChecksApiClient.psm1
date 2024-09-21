# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class PipelinesChecksApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # PipelinesChecksApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PipelinesChecksApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get Check configuration by resource type and id
    [PSObject] GetCheckConfigurationsOnResource([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "pipelines/checks/configurations", $this.apiVersion, $null)
    }
     # Add a check configuration
    [PSObject] AddCheckConfiguration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "pipelines/checks/configurations", $this.apiVersion, $body)
    }

    # Get Check configuration by Id
    [PSObject] GetCheckConfiguration([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "pipelines/checks/configurations/$id", $this.apiVersion, $null)
    }
     # Delete check configuration by id
    [PSObject] DeleteCheckConfiguration([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'delete', "pipelines/checks/configurations/$id", $this.apiVersion, $null)
    }
     # Update check configuration
    [PSObject] UpdateCheckConfiguration([bool] $useTargetProject, [PSObject] $body, [int] $id) {
        return $this.Request($useTargetProject, 'patch', "pipelines/checks/configurations/$id", $this.apiVersion, $body)
    }

    # Get check configurations for multiple resources by resource type and id.
    [PSObject] QueryCheckConfigurationsOnResources([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "pipelines/checks/queryconfigurations", $this.apiVersion, $body)
    }

    # Initiate an evaluation for a check in a pipeline
    [PSObject] EvaluateCheckSuite([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "pipelines/checks/runs", $this.apiVersion, $body)
    }

    # Update a check run of a check suiteFollowing update actions are supported:* rerun - allows to rerun an already completed check, if the check retry interval is 0* bypass - applied on a check which has not already been bypassed and whose check suite is not completed yet
    [PSObject] UpdateCheckSuite([bool] $useTargetProject, [PSObject] $body, [string] $checkSuiteId) {
        return $this.Request($useTargetProject, 'patch', "pipelines/checks/runs/$checkSuiteId", $this.apiVersion, $body)
    }
     # Get details for a specific check evaluation
    [PSObject] GetCheckSuite([bool] $useTargetProject, [string] $checkSuiteId) {
        return $this.Request($useTargetProject, 'get', "pipelines/checks/runs/$checkSuiteId", $this.apiVersion, $null)
    }

}


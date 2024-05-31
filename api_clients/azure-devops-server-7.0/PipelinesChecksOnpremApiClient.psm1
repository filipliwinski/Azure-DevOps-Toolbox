# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class PipelinesChecksOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0-preview'

    # PipelinesChecksOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PipelinesChecksOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Add a check configuration
    [PSObject] AddCheckConfiguration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "pipelines/checks/configurations", $this.apiVersion, $body)
    }
     # Get Check configuration by resource type and id
    [PSObject] GetCheckConfigurationsOnResource([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "pipelines/checks/configurations", $this.apiVersion, $null)
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

    # Get details for a specific check evaluation
    [PSObject] GetCheckSuite([bool] $useTargetProject, [string] $checkSuiteId) {
        return $this.Request($useTargetProject, 'get', "pipelines/checks/runs/$checkSuiteId", $this.apiVersion, $null)
    }

}


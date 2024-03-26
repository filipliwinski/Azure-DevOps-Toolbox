# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class PipelinesApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # PipelinesApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PipelinesApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of pipelines.
    [PSObject] ListPipelines([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "pipelines", $this.apiVersion, $null)
    }
     # Create a pipeline.
    [PSObject] CreatePipeline([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "pipelines", $this.apiVersion, $body)
    }

    # Gets a pipeline, optionally at the specified version
    [PSObject] GetPipeline([bool] $useTargetProject, [int] $pipelineId) {
        return $this.Request($useTargetProject, 'get', "pipelines/$pipelineId", $this.apiVersion, $null)
    }

    # Queues a dry run of the pipeline and returns an object containing the final yaml.
    [PSObject] Preview([bool] $useTargetProject, [PSObject] $body, [int] $pipelineId) {
        return $this.Request($useTargetProject, 'post', "pipelines/$pipelineId/preview", $this.apiVersion, $body)
    }

    # Runs a pipeline.
    [PSObject] RunPipeline([bool] $useTargetProject, [PSObject] $body, [int] $pipelineId) {
        return $this.Request($useTargetProject, 'post', "pipelines/$pipelineId/runs", $this.apiVersion, $body)
    }
     # Gets top 10000 runs for a particular pipeline.
    [PSObject] ListRuns([bool] $useTargetProject, [int] $pipelineId) {
        return $this.Request($useTargetProject, 'get', "pipelines/$pipelineId/runs", $this.apiVersion, $null)
    }

    # Gets a run for a particular pipeline.
    [PSObject] GetRun([bool] $useTargetProject, [int] $pipelineId, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "pipelines/$pipelineId/runs/$runId", $this.apiVersion, $null)
    }

    # Get a specific artifact from a pipeline run
    [PSObject] GetArtifact([bool] $useTargetProject, [int] $pipelineId, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "pipelines/$pipelineId/runs/$runId/artifacts", $this.apiVersion, $null)
    }

    # Get a list of logs from a pipeline run.
    [PSObject] ListLogs([bool] $useTargetProject, [int] $pipelineId, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "pipelines/$pipelineId/runs/$runId/logs", $this.apiVersion, $null)
    }

    # Get a specific log from a pipeline run
    [PSObject] GetLog([bool] $useTargetProject, [int] $pipelineId, [int] $runId, [int] $logId) {
        return $this.Request($useTargetProject, 'get', "pipelines/$pipelineId/runs/$runId/logs/$logId", $this.apiVersion, $null)
    }

}


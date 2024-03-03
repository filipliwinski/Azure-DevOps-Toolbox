# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class PipelinePermissionsOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0-preview'

    # PipelinePermissionsOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PipelinePermissionsOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Batch API to authorize/unauthorize a list of definitions for a multiple resources.
    [PSObject] UpdatePipelinePermisionsForResources([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "pipelines/pipelinepermissions", $this.apiVersion, $body)
    }

    # Given a ResourceType and ResourceId, returns authorized definitions for that resource.
    [PSObject] GetPipelinePermissionsForResource([bool] $useTargetProject, [string] $resourceType, [string] $resourceId) {
        return $this.Request($useTargetProject, 'get', "pipelines/pipelinepermissions/$resourceType/$resourceId", $this.apiVersion, $null)
    }
     # Authorizes/Unauthorizes a list of definitions for a given resource.
    [PSObject] UpdatePipelinePermisionsForResource([bool] $useTargetProject, [PSObject] $body, [string] $resourceType, [string] $resourceId) {
        return $this.Request($useTargetProject, 'patch', "pipelines/pipelinepermissions/$resourceType/$resourceId", $this.apiVersion, $body)
    }

}


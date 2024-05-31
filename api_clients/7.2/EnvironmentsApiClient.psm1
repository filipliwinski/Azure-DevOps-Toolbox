# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class EnvironmentsApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # EnvironmentsApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    EnvironmentsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Create an environment.
    [PSObject] AddEnvironment([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "pipelines/environments", $this.apiVersion, $body)
    }
     # Get all environments.
    [PSObject] GetEnvironments([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "pipelines/environments", $this.apiVersion, $null)
    }

    # Get an environment by its ID.
    [PSObject] GetEnvironmentById([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "pipelines/environments/$environmentId", $this.apiVersion, $null)
    }
     # Delete the specified environment.
    [PSObject] DeleteEnvironment([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'delete', "pipelines/environments/$environmentId", $this.apiVersion, $null)
    }
     # Update the specified environment.
    [PSObject] UpdateEnvironment([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'patch', "pipelines/environments/$environmentId", $this.apiVersion, $body)
    }

    # Get environment deployment execution history
    [PSObject] GetEnvironmentDeploymentExecutionRecords([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "pipelines/environments/$environmentId/environmentdeploymentrecords", $this.apiVersion, $null)
    }

    # empty
    [PSObject] AddKubernetesResource([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'post', "pipelines/environments/$environmentId/providers/kubernetes", $this.apiVersion, $body)
    }
     # empty
    [PSObject] UpdateKubernetesResource([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'patch', "pipelines/environments/$environmentId/providers/kubernetes", $this.apiVersion, $body)
    }

    # empty
    [PSObject] DeleteKubernetesResource([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'delete', "pipelines/environments/$environmentId/providers/kubernetes/$resourceId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] GetKubernetesResource([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'get', "pipelines/environments/$environmentId/providers/kubernetes/$resourceId", $this.apiVersion, $null)
    }

    # Get Virtual Machine Resources
    [PSObject] GetVirtualMachineResources([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "pipelines/environments/$environmentId/providers/virtualmachines", $this.apiVersion, $null)
    }
     # Update Virtual Machine Resource
    [PSObject] UpdateVirtualMachineResource([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'patch', "pipelines/environments/$environmentId/providers/virtualmachines", $this.apiVersion, $body)
    }
     # Add Virtual Machine Resource
    [PSObject] AddVirtualMachineResource([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'post', "pipelines/environments/$environmentId/providers/virtualmachines", $this.apiVersion, $body)
    }
     # Replace Virtual Machine Resource
    [PSObject] ReplaceVirtualMachineResource([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'put', "pipelines/environments/$environmentId/providers/virtualmachines", $this.apiVersion, $body)
    }

    # Delete Virtual Machine Resource
    [PSObject] DeleteVirtualMachineResource([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'delete', "pipelines/environments/$environmentId/providers/virtualmachines/$resourceId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetLinkedPool([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "pipelines/environments/$environmentId/providers/virtualmachines/pool", $this.apiVersion, $null)
    }

    # GET a PAT token for creating and deleting deployment targets in an environment.
    [PSObject] GenerateEnvironmentAccessToken([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'post', "pipelines/environments/environmentaccesstoken/$environmentId", $this.apiVersion, $null)
    }

}


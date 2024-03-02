# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class ElasticApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

    # ElasticApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ElasticApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of all Elastic Pools.
    [PSObject] GetElasticPools([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/elasticpools", $this.apiVersion, $null)
    }
     # Create a new elastic pool. This will create a new TaskAgentPool at the organization level. If a project id is provided, this will create a new TaskAgentQueue in the specified project.
    [PSObject] CreateElasticPool([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/elasticpools", $this.apiVersion, $body)
    }

    # Update settings on a specified Elastic Pool.
    [PSObject] UpdateElasticPool([bool] $useTargetProject, [PSObject] $body, [int] $poolId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/elasticpools/$poolId", $this.apiVersion, $body)
    }
     # Returns the Elastic Pool with the specified Pool Id.
    [PSObject] GetElasticPool([bool] $useTargetProject, [int] $poolId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/elasticpools/$poolId", $this.apiVersion, $null)
    }

    # Get elastic pool diagnostics logs for a specified Elastic Pool.
    [PSObject] GetElasticPoolLogs([bool] $useTargetProject, [int] $poolId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/elasticpools/$poolId/logs", $this.apiVersion, $null)
    }

    # Get a list of ElasticNodes currently in the ElasticPool
    [PSObject] GetElasticNodes([bool] $useTargetProject, [int] $poolId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/elasticpools/$poolId/nodes", $this.apiVersion, $null)
    }

    # Update properties on a specified ElasticNode
    [PSObject] UpdateElasticNode([bool] $useTargetProject, [PSObject] $body, [int] $poolId, [int] $elasticNodeId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/elasticpools/$poolId/nodes/$elasticNodeId", $this.apiVersion, $body)
    }

}


# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class TaskAgentApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0'

    # TaskAgentApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TaskAgentApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # empty
    [PSObject] AddAgentCloud([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/agentclouds", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetAgentClouds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/agentclouds", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetAgentCloud([bool] $useTargetProject, [int] $agentCloudId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/agentclouds/$agentCloudId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateAgentCloud([bool] $useTargetProject, [PSObject] $body, [int] $agentCloudId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/agentclouds/$agentCloudId", $this.apiVersion, $body)
    }
     # empty
    [PSObject] DeleteAgentCloud([bool] $useTargetProject, [int] $agentCloudId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/agentclouds/$agentCloudId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetAgentCloudRequests([bool] $useTargetProject, [int] $agentCloudId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/agentclouds/$agentCloudId/requests", $this.apiVersion, $null)
    }

    # Get agent cloud types.
    [PSObject] GetAgentCloudTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/agentcloudtypes", $this.apiVersion, $null)
    }

    # Create an agent pool.
    [PSObject] AddAgentPool([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/pools", $this.apiVersion, $body)
    }
     # Get a list of agent pools.
    [PSObject] GetAgentPoolsByIds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/pools", $this.apiVersion, $null)
    }

    # Get information about an agent pool.
    [PSObject] GetAgentPool([bool] $useTargetProject, [int] $poolId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/pools/$poolId", $this.apiVersion, $null)
    }
     # Update properties on an agent pool
    [PSObject] UpdateAgentPool([bool] $useTargetProject, [PSObject] $body, [int] $poolId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/pools/$poolId", $this.apiVersion, $body)
    }
     # Delete an agent pool.
    [PSObject] DeleteAgentPool([bool] $useTargetProject, [int] $poolId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/pools/$poolId", $this.apiVersion, $null)
    }

    # Adds an agent to a pool.  You probably don't want to call this endpoint directly. Instead, [configure an agent](https://docs.microsoft.com/azure/devops/pipelines/agents/agents) using the agent download package.
    [PSObject] AddAgent([bool] $useTargetProject, [PSObject] $body, [int] $poolId) {
        return $this.Request($useTargetProject, 'post', "distributedtask/pools/$poolId/agents", $this.apiVersion, $body)
    }
     # Get a list of agents.
    [PSObject] GetAgents([bool] $useTargetProject, [int] $poolId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/pools/$poolId/agents", $this.apiVersion, $null)
    }

    # Get information about an agent.
    [PSObject] GetAgent([bool] $useTargetProject, [int] $poolId, [int] $agentId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/pools/$poolId/agents/$agentId", $this.apiVersion, $null)
    }
     # Update agent details.
    [PSObject] UpdateAgent([bool] $useTargetProject, [PSObject] $body, [int] $poolId, [int] $agentId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/pools/$poolId/agents/$agentId", $this.apiVersion, $body)
    }
     # Replace an agent.  You probably don't want to call this endpoint directly. Instead, [use the agent configuration script](https://docs.microsoft.com/azure/devops/pipelines/agents/agents) to remove and reconfigure an agent from your organization.
    [PSObject] ReplaceAgent([bool] $useTargetProject, [PSObject] $body, [int] $poolId, [int] $agentId) {
        return $this.Request($useTargetProject, 'put', "distributedtask/pools/$poolId/agents/$agentId", $this.apiVersion, $body)
    }
     # Delete an agent.  You probably don't want to call this endpoint directly. Instead, [use the agent configuration script](https://docs.microsoft.com/azure/devops/pipelines/agents/agents) to remove an agent from your organization.
    [PSObject] DeleteAgent([bool] $useTargetProject, [int] $poolId, [int] $agentId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/pools/$poolId/agents/$agentId", $this.apiVersion, $null)
    }

    # Add a variable group.
    [PSObject] AddVariableGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/variablegroups", $this.apiVersion, $body)
    }
     # Add a variable group.
    [PSObject] ShareVariableGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/variablegroups", $this.apiVersion, $body)
    }

    # Delete a variable group
    [PSObject] DeleteVariableGroup([bool] $useTargetProject, [int] $groupId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/variablegroups/$groupId", $this.apiVersion, $null)
    }
     # Update a variable group.
    [PSObject] UpdateVariableGroup([bool] $useTargetProject, [PSObject] $body, [int] $groupId) {
        return $this.Request($useTargetProject, 'put', "distributedtask/variablegroups/$groupId", $this.apiVersion, $body)
    }

    # GET the Yaml schema used for Yaml file validation.
    [PSObject] GetYamlSchema([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/yamlschema", $this.apiVersion, $null)
    }

    # Create a deployment group.
    [PSObject] AddDeploymentGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/deploymentgroups", $this.apiVersion, $body)
    }
     # Get a list of deployment groups by name or IDs.
    [PSObject] GetDeploymentGroups([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups", $this.apiVersion, $null)
    }

    # Get a deployment group by its ID.
    [PSObject] GetDeploymentGroup([bool] $useTargetProject, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups/$deploymentGroupId", $this.apiVersion, $null)
    }
     # Update a deployment group.
    [PSObject] UpdateDeploymentGroup([bool] $useTargetProject, [PSObject] $body, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/deploymentgroups/$deploymentGroupId", $this.apiVersion, $body)
    }
     # Delete a deployment group.
    [PSObject] DeleteDeploymentGroup([bool] $useTargetProject, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/deploymentgroups/$deploymentGroupId", $this.apiVersion, $null)
    }

    # Get a list of deployment targets in a deployment group.
    [PSObject] GetDeploymentTargets([bool] $useTargetProject, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups/$deploymentGroupId/targets", $this.apiVersion, $null)
    }
     # Update tags of a list of deployment targets in a deployment group.
    [PSObject] UpdateDeploymentTargets([bool] $useTargetProject, [PSObject] $body, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/deploymentgroups/$deploymentGroupId/targets", $this.apiVersion, $body)
    }

    # Delete a deployment target in a deployment group. This deletes the agent from associated deployment pool too.
    [PSObject] DeleteDeploymentTarget([bool] $useTargetProject, [int] $deploymentGroupId, [int] $targetId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/deploymentgroups/$deploymentGroupId/targets/$targetId", $this.apiVersion, $null)
    }
     # Get a deployment target by its ID in a deployment group
    [PSObject] GetDeploymentTarget([bool] $useTargetProject, [int] $deploymentGroupId, [int] $targetId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups/$deploymentGroupId/targets/$targetId", $this.apiVersion, $null)
    }

    # Create an environment.
    [PSObject] AddEnvironment([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/environments", $this.apiVersion, $body)
    }
     # Get all environments.
    [PSObject] GetEnvironments([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/environments", $this.apiVersion, $null)
    }

    # Get an environment by its ID.
    [PSObject] GetEnvironmentById([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/environments/$environmentId", $this.apiVersion, $null)
    }
     # Update the specified environment.
    [PSObject] UpdateEnvironment([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/environments/$environmentId", $this.apiVersion, $body)
    }
     # Delete the specified environment.
    [PSObject] DeleteEnvironment([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/environments/$environmentId", $this.apiVersion, $null)
    }

    # Get environment deployment execution history
    [PSObject] GetEnvironmentDeploymentExecutionRecords([bool] $useTargetProject, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/environments/$environmentId/environmentdeploymentrecords", $this.apiVersion, $null)
    }

    # empty
    [PSObject] AddKubernetesResource([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'post', "distributedtask/environments/$environmentId/providers/kubernetes", $this.apiVersion, $body)
    }

    # empty
    [PSObject] DeleteKubernetesResource([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/environments/$environmentId/providers/kubernetes/$resourceId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] GetKubernetesResource([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/environments/$environmentId/providers/kubernetes/$resourceId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] AddVirtualMachineGroup([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'post', "distributedtask/environments/$environmentId/providers/virtualmachinegroups", $this.apiVersion, $body)
    }
     # empty
    [PSObject] UpdateVirtualMachineGroup([bool] $useTargetProject, [PSObject] $body, [int] $environmentId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/environments/$environmentId/providers/virtualmachinegroups", $this.apiVersion, $body)
    }

    # empty
    [PSObject] DeleteVirtualMachineGroup([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/environments/$environmentId/providers/virtualmachinegroups/$resourceId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] GetVirtualMachineGroup([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/environments/$environmentId/providers/virtualmachinegroups/$resourceId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetVirtualMachines([bool] $useTargetProject, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/environments/$environmentId/providers/virtualmachinegroups/$resourceId/virtualmachines", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateVirtualMachines([bool] $useTargetProject, [PSObject] $body, [int] $environmentId, [int] $resourceId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/environments/$environmentId/providers/virtualmachinegroups/$resourceId/virtualmachines", $this.apiVersion, $body)
    }

    # Create a new agent queue to connect a project to an agent pool.
    [PSObject] AddAgentQueue([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/queues", $this.apiVersion, $body)
    }
     # Get a list of agent queues by pool ids
    [PSObject] GetAgentQueuesForPools([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/queues", $this.apiVersion, $null)
    }

    # Removes an agent queue from a project.
    [PSObject] DeleteAgentQueue([bool] $useTargetProject, [int] $queueId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/queues/$queueId", $this.apiVersion, $null)
    }
     # Get information about an agent queue.
    [PSObject] GetAgentQueue([bool] $useTargetProject, [int] $queueId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/queues/$queueId", $this.apiVersion, $null)
    }

    # Create a task group.
    [PSObject] AddTaskGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/taskgroups", $this.apiVersion, $body)
    }

    # List task groups.
    [PSObject] GetTaskGroups([bool] $useTargetProject, [string] $taskGroupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/taskgroups/$taskGroupId", $this.apiVersion, $null)
    }
     # Update a task group.
    [PSObject] UpdateTaskGroup([bool] $useTargetProject, [PSObject] $body, [string] $taskGroupId) {
        return $this.Request($useTargetProject, 'put', "distributedtask/taskgroups/$taskGroupId", $this.apiVersion, $body)
    }
     # Delete a task group.
    [PSObject] DeleteTaskGroup([bool] $useTargetProject, [string] $taskGroupId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/taskgroups/$taskGroupId", $this.apiVersion, $null)
    }

    # Get variable groups by ids.
    [PSObject] GetVariableGroupsById([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/variablegroups", $this.apiVersion, $null)
    }

    # Get a variable group.
    [PSObject] GetVariableGroup([bool] $useTargetProject, [int] $groupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/variablegroups/$groupId", $this.apiVersion, $null)
    }

}


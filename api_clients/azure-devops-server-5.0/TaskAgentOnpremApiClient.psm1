# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TaskAgentOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0'

    # TaskAgentOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TaskAgentOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # empty
    [PSObject] GetAgentClouds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/agentclouds", $this.apiVersion, $null)
    }
     # empty
    [PSObject] AddAgentCloud([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/agentclouds", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetAgentCloud([bool] $useTargetProject, [int] $agentCloudId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/agentclouds/$agentCloudId", $this.apiVersion, $null)
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

    # Get a list of deployment groups by name or IDs.
    [PSObject] GetDeploymentGroups([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups", $this.apiVersion, $null)
    }
     # Create a deployment group.
    [PSObject] AddDeploymentGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/deploymentgroups", $this.apiVersion, $body)
    }

    # Update a deployment group.
    [PSObject] UpdateDeploymentGroup([bool] $useTargetProject, [PSObject] $body, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/deploymentgroups/$deploymentGroupId", $this.apiVersion, $body)
    }
     # Get a deployment group by its ID.
    [PSObject] GetDeploymentGroup([bool] $useTargetProject, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups/$deploymentGroupId", $this.apiVersion, $null)
    }
     # Delete a deployment group.
    [PSObject] DeleteDeploymentGroup([bool] $useTargetProject, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/deploymentgroups/$deploymentGroupId", $this.apiVersion, $null)
    }

    # Update tags of a list of deployment targets in a deployment group.
    [PSObject] UpdateDeploymentTargets([bool] $useTargetProject, [PSObject] $body, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'patch', "distributedtask/deploymentgroups/$deploymentGroupId/targets", $this.apiVersion, $body)
    }
     # Get a list of deployment targets in a deployment group.
    [PSObject] GetDeploymentTargets([bool] $useTargetProject, [int] $deploymentGroupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups/$deploymentGroupId/targets", $this.apiVersion, $null)
    }

    # Get a deployment target by its ID in a deployment group
    [PSObject] GetDeploymentTarget([bool] $useTargetProject, [int] $deploymentGroupId, [int] $targetId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/deploymentgroups/$deploymentGroupId/targets/$targetId", $this.apiVersion, $null)
    }
     # Delete a deployment target in a deployment group. This deletes the agent from associated deployment pool too.
    [PSObject] DeleteDeploymentTarget([bool] $useTargetProject, [int] $deploymentGroupId, [int] $targetId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/deploymentgroups/$deploymentGroupId/targets/$targetId", $this.apiVersion, $null)
    }

    # Create a task group.
    [PSObject] AddTaskGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/taskgroups", $this.apiVersion, $body)
    }

    # Update a task group.
    [PSObject] UpdateTaskGroup([bool] $useTargetProject, [PSObject] $body, [string] $taskGroupId) {
        return $this.Request($useTargetProject, 'put', "distributedtask/taskgroups/$taskGroupId", $this.apiVersion, $body)
    }
     # List task groups.
    [PSObject] GetTaskGroups([bool] $useTargetProject, [string] $taskGroupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/taskgroups/$taskGroupId", $this.apiVersion, $null)
    }
     # Delete a task group.
    [PSObject] DeleteTaskGroup([bool] $useTargetProject, [string] $taskGroupId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/taskgroups/$taskGroupId", $this.apiVersion, $null)
    }

    # Get variable groups by ids.
    [PSObject] GetVariableGroupsById([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "distributedtask/variablegroups", $this.apiVersion, $null)
    }
     # Add a variable group.
    [PSObject] AddVariableGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "distributedtask/variablegroups", $this.apiVersion, $body)
    }

    # Update a variable group.
    [PSObject] UpdateVariableGroup([bool] $useTargetProject, [PSObject] $body, [int] $groupId) {
        return $this.Request($useTargetProject, 'put', "distributedtask/variablegroups/$groupId", $this.apiVersion, $body)
    }
     # Get a variable group.
    [PSObject] GetVariableGroup([bool] $useTargetProject, [int] $groupId) {
        return $this.Request($useTargetProject, 'get', "distributedtask/variablegroups/$groupId", $this.apiVersion, $null)
    }
     # Delete a variable group
    [PSObject] DeleteVariableGroup([bool] $useTargetProject, [int] $groupId) {
        return $this.Request($useTargetProject, 'delete', "distributedtask/variablegroups/$groupId", $this.apiVersion, $null)
    }

}


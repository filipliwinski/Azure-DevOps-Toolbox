# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class WorkItemTrackingProcessOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '4.1-preview'

    # WorkItemTrackingProcessOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WorkItemTrackingProcessOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Creates a process.
    [PSObject] CreateProcess([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "work/processes", $this.apiVersion, $body)
    }
     # Returns a list of all processes.
    [PSObject] GetProcesses([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/processes", $this.apiVersion, $null)
    }

    # Returns a list of all behaviors in the process.
    [PSObject] GetBehaviors([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/behaviors", $this.apiVersion, $null)
    }

    # Returns a behavior of the process.
    [PSObject] GetBehavior([bool] $useTargetProject, [string] $processId, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }

    # Returns a list of all fields in a process.
    [PSObject] GetFields([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/fields", $this.apiVersion, $null)
    }

    # Returns a list of all work item types in a process.
    [PSObject] GetWorkItemTypes([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workitemtypes", $this.apiVersion, $null)
    }

    # Returns a single work item type in a process.
    [PSObject] GetWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workitemtypes/$witRefName", $this.apiVersion, $null)
    }

    # Returns a list of all fields in a work item type.
    [PSObject] GetWorkItemTypeFields([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/fields", $this.apiVersion, $null)
    }

    # Adds a rule to work item type in the process.
    [PSObject] AddWorkItemTypeRule([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/rules", $this.apiVersion, $body)
    }
     # Returns a list of all rules in the work item type of the process.
    [PSObject] GetWorkItemTypeRules([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/rules", $this.apiVersion, $null)
    }

    # Returns a single rule in the work item type of the process.
    [PSObject] GetWorkItemTypeRule([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $ruleId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/rules/$ruleId", $this.apiVersion, $null)
    }
     # Removes a rule from the work item type in the process.
    [PSObject] DeleteWorkItemTypeRule([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $ruleId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/rules/$ruleId", $this.apiVersion, $null)
    }
     # Updates a rule in the work item type of the process.
    [PSObject] UpdateWorkItemTypeRule([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $ruleId) {
        return $this.Request($useTargetProject, 'put', "work/processes/$processId/workItemTypes/$witRefName/rules/$ruleId", $this.apiVersion, $body)
    }

    # Returns a list of all state definitions in a work item type of the process.
    [PSObject] GetStateDefinitions([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/states", $this.apiVersion, $null)
    }

    # Returns a single state definition in a work item type of the process.
    [PSObject] GetStateDefinition([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $null)
    }

    # Returns a single process of a specified ID.
    [PSObject] GetProcessById([bool] $useTargetProject, [string] $processTypeId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processTypeId", $this.apiVersion, $null)
    }
     # Removes a process of a specific ID.
    [PSObject] DeleteProcess([bool] $useTargetProject, [string] $processTypeId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processTypeId", $this.apiVersion, $null)
    }
     # Updates a process of a specific ID.
    [PSObject] UpdateProcess([bool] $useTargetProject, [PSObject] $body, [string] $processTypeId) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processTypeId", $this.apiVersion, $body)
    }

}


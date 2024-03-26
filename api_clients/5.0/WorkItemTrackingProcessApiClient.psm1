# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class WorkItemTrackingProcessApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0-preview'

    # WorkItemTrackingProcessApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WorkItemTrackingProcessApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get list of all processes including system and inherited.
    [PSObject] GetListOfProcesses([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/processes", $this.apiVersion, $null)
    }
     # Creates a process.
    [PSObject] CreateNewProcess([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "work/processes", $this.apiVersion, $body)
    }

    # Returns a list of all behaviors in the process.
    [PSObject] GetProcessBehaviors([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/behaviors", $this.apiVersion, $null)
    }
     # Creates a single behavior in the given process.
    [PSObject] CreateProcessBehavior([bool] $useTargetProject, [PSObject] $body, [string] $processId) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/behaviors", $this.apiVersion, $body)
    }

    # Replaces a behavior in the process.
    [PSObject] UpdateProcessBehavior([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'put', "work/processes/$processId/behaviors/$behaviorRefName", $this.apiVersion, $body)
    }
     # Returns a behavior of the process.
    [PSObject] GetProcessBehavior([bool] $useTargetProject, [string] $processId, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }
     # Removes a behavior in the process.
    [PSObject] DeleteProcessBehavior([bool] $useTargetProject, [string] $processId, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }

    # Returns a list of all work item types in a process.
    [PSObject] GetProcessWorkItemTypes([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workitemtypes", $this.apiVersion, $null)
    }
     # Creates a work item type in the process.
    [PSObject] CreateProcessWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workitemtypes", $this.apiVersion, $body)
    }

    # Updates a work item type of the process.
    [PSObject] UpdateProcessWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workitemtypes/$witRefName", $this.apiVersion, $body)
    }
     # Returns a single work item type in a process.
    [PSObject] GetProcessWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workitemtypes/$witRefName", $this.apiVersion, $null)
    }
     # Removes a work itewm type in the process.
    [PSObject] DeleteProcessWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workitemtypes/$witRefName", $this.apiVersion, $null)
    }

    # Returns a list of all fields in a work item type.
    [PSObject] GetAllWorkItemTypeFields([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/fields", $this.apiVersion, $null)
    }
     # Adds a field to a work item type.
    [PSObject] AddFieldToWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/fields", $this.apiVersion, $body)
    }

    # Updates a field in a work item type.
    [PSObject] UpdateWorkItemTypeField([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $fieldRefName) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workItemTypes/$witRefName/fields/$fieldRefName", $this.apiVersion, $body)
    }
     # Removes a field from a work item type. Does not permanently delete the field.
    [PSObject] RemoveWorkItemTypeField([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $fieldRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/fields/$fieldRefName", $this.apiVersion, $null)
    }
     # Returns a field in a work item type.
    [PSObject] GetWorkItemTypeField([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $fieldRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/fields/$fieldRefName", $this.apiVersion, $null)
    }

    # Gets the form layout.
    [PSObject] GetFormLayout([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/layout", $this.apiVersion, $null)
    }

    # Creates a control in a group.
    [PSObject] CreateControlInGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $groupId) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls", $this.apiVersion, $body)
    }

    # Updates a control on the work item form.
    [PSObject] UpdateControl([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $groupId, [string] $controlId) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls/$controlId", $this.apiVersion, $body)
    }
     # Removes a control from the work item form.
    [PSObject] RemoveControlFromGroup([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $groupId, [string] $controlId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls/$controlId", $this.apiVersion, $null)
    }
     # Moves a control to a specified group.
    [PSObject] MoveControlToGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $groupId, [string] $controlId) {
        return $this.Request($useTargetProject, 'put', "work/processes/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls/$controlId", $this.apiVersion, $body)
    }

    # Updates a page on the work item form
    [PSObject] UpdatePage([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workItemTypes/$witRefName/layout/pages", $this.apiVersion, $body)
    }
     # Adds a page to the work item form.
    [PSObject] AddPage([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/layout/pages", $this.apiVersion, $body)
    }

    # Removes a page from the work item form
    [PSObject] RemovePage([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $pageId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/layout/pages/$pageId", $this.apiVersion, $null)
    }

    # Adds a group to the work item form.
    [PSObject] AddGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups", $this.apiVersion, $body)
    }

    # Updates a group in the work item form.
    [PSObject] UpdateGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId, [string] $groupId) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups/$groupId", $this.apiVersion, $body)
    }
     # Removes a group from the work item form.
    [PSObject] RemoveGroup([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId, [string] $groupId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups/$groupId", $this.apiVersion, $null)
    }
     # Moves a group to a different section.
    [PSObject] MoveGroupToSection([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId, [string] $groupId) {
        return $this.Request($useTargetProject, 'put', "work/processes/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups/$groupId", $this.apiVersion, $body)
    }

    # Returns a list of all rules in the work item type of the process.
    [PSObject] GetProcessWorkItemTypeRules([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/rules", $this.apiVersion, $null)
    }
     # Adds a rule to work item type in the process.
    [PSObject] AddProcessWorkItemTypeRule([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/rules", $this.apiVersion, $body)
    }

    # Updates a rule in the work item type of the process.
    [PSObject] UpdateProcessWorkItemTypeRule([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $ruleId) {
        return $this.Request($useTargetProject, 'put', "work/processes/$processId/workItemTypes/$witRefName/rules/$ruleId", $this.apiVersion, $body)
    }
     # Returns a single rule in the work item type of the process.
    [PSObject] GetProcessWorkItemTypeRule([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $ruleId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/rules/$ruleId", $this.apiVersion, $null)
    }
     # Removes a rule from the work item type in the process.
    [PSObject] DeleteProcessWorkItemTypeRule([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $ruleId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/rules/$ruleId", $this.apiVersion, $null)
    }

    # Returns a list of all state definitions in a work item type of the process.
    [PSObject] GetStateDefinitions([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/states", $this.apiVersion, $null)
    }
     # Creates a state definition in the work item type of the process.
    [PSObject] CreateStateDefinition([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workItemTypes/$witRefName/states", $this.apiVersion, $body)
    }

    # Updates a given state definition in the work item type of the process.
    [PSObject] UpdateStateDefinition([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $body)
    }
     # Hides a state definition in the work item type of the process.Only states with customizationType:System can be hidden.
    [PSObject] HideStateDefinition([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'put', "work/processes/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $body)
    }
     # Returns a single state definition in a work item type of the process.
    [PSObject] GetStateDefinition([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $null)
    }
     # Removes a state definition in the work item type of the process.
    [PSObject] DeleteStateDefinition([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $null)
    }

    # Updates a behavior for the work item type of the process.
    [PSObject] UpdateBehaviorToWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefNameForBehaviors) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processId/workitemtypesbehaviors/$witRefNameForBehaviors/behaviors", $this.apiVersion, $body)
    }
     # Returns a list of all behaviors for the work item type of the process.
    [PSObject] GetBehaviorsForWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForBehaviors) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workitemtypesbehaviors/$witRefNameForBehaviors/behaviors", $this.apiVersion, $null)
    }
     # Adds a behavior to the work item type of the process.
    [PSObject] AddBehaviorToWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefNameForBehaviors) {
        return $this.Request($useTargetProject, 'post', "work/processes/$processId/workitemtypesbehaviors/$witRefNameForBehaviors/behaviors", $this.apiVersion, $body)
    }

    # Removes a behavior for the work item type of the process.
    [PSObject] RemoveBehaviorFromWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForBehaviors, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processId/workitemtypesbehaviors/$witRefNameForBehaviors/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }
     # Returns a behavior for the work item type of the process.
    [PSObject] GetBehaviorForWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForBehaviors, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processId/workitemtypesbehaviors/$witRefNameForBehaviors/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }

    # Get a single process of a specified ID.
    [PSObject] GetProcessByItsId([bool] $useTargetProject, [string] $processTypeId) {
        return $this.Request($useTargetProject, 'get', "work/processes/$processTypeId", $this.apiVersion, $null)
    }
     # Edit a process of a specific ID.
    [PSObject] EditProcess([bool] $useTargetProject, [PSObject] $body, [string] $processTypeId) {
        return $this.Request($useTargetProject, 'patch', "work/processes/$processTypeId", $this.apiVersion, $body)
    }
     # Removes a process of a specific ID.
    [PSObject] DeleteProcessById([bool] $useTargetProject, [string] $processTypeId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/$processTypeId", $this.apiVersion, $null)
    }

    # Returns meta data of the picklist.
    [PSObject] GetListsMetadata([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/processes/lists", $this.apiVersion, $null)
    }
     # Creates a picklist.
    [PSObject] CreateList([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "work/processes/lists", $this.apiVersion, $body)
    }

    # Updates a list.
    [PSObject] UpdateList([bool] $useTargetProject, [PSObject] $body, [string] $listId) {
        return $this.Request($useTargetProject, 'put', "work/processes/lists/$listId", $this.apiVersion, $body)
    }
     # Returns a picklist.
    [PSObject] GetList([bool] $useTargetProject, [string] $listId) {
        return $this.Request($useTargetProject, 'get', "work/processes/lists/$listId", $this.apiVersion, $null)
    }
     # Removes a picklist.
    [PSObject] DeleteList([bool] $useTargetProject, [string] $listId) {
        return $this.Request($useTargetProject, 'delete', "work/processes/lists/$listId", $this.apiVersion, $null)
    }

}


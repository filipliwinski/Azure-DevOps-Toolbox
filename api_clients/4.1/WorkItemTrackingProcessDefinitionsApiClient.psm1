# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class WorkItemTrackingProcessDefinitionsApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '4.1-preview'

    # WorkItemTrackingProcessDefinitionsApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WorkItemTrackingProcessDefinitionsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Returns a list of all behaviors in the process.
    [PSObject] GetBehaviors([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/behaviors", $this.apiVersion, $null)
    }
     # Creates a single behavior in the given process.
    [PSObject] CreateBehavior([bool] $useTargetProject, [PSObject] $body, [string] $processId) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/behaviors", $this.apiVersion, $body)
    }

    # Replaces a behavior in the process.
    [PSObject] ReplaceBehavior([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $behaviorId) {
        return $this.Request($useTargetProject, 'put', "work/processdefinitions/$processId/behaviors/$behaviorId", $this.apiVersion, $body)
    }
     # Removes a behavior in the process.
    [PSObject] DeleteBehavior([bool] $useTargetProject, [string] $processId, [string] $behaviorId) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/behaviors/$behaviorId", $this.apiVersion, $null)
    }
     # Returns a single behavior in the process.
    [PSObject] GetBehavior([bool] $useTargetProject, [string] $processId, [string] $behaviorId) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/behaviors/$behaviorId", $this.apiVersion, $null)
    }

    # Updates a given field in the process.
    [PSObject] UpdateField([bool] $useTargetProject, [PSObject] $body, [string] $processId) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/fields", $this.apiVersion, $body)
    }
     # Creates a single field in the process.
    [PSObject] CreateField([bool] $useTargetProject, [PSObject] $body, [string] $processId) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/fields", $this.apiVersion, $body)
    }

    # Returns a list of all work item types in the process.
    [PSObject] GetWorkItemTypes([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workitemtypes", $this.apiVersion, $null)
    }
     # Creates a work item type in the process.
    [PSObject] CreateWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workitemtypes", $this.apiVersion, $body)
    }

    # Updates a work item type of the process.
    [PSObject] UpdateWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/workitemtypes/$witRefName", $this.apiVersion, $body)
    }
     # Removes a work itewm type in the process.
    [PSObject] DeleteWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workitemtypes/$witRefName", $this.apiVersion, $null)
    }
     # Returns a work item type of the process.
    [PSObject] GetWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workitemtypes/$witRefName", $this.apiVersion, $null)
    }

    # Gets the form layout
    [PSObject] GetFormLayout([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout", $this.apiVersion, $null)
    }

    # Creates a control in a group
    [PSObject] AddControlToGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $groupId) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls", $this.apiVersion, $body)
    }

    # Moves a control to a new group
    [PSObject] SetControlInGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $groupId, [string] $controlId) {
        return $this.Request($useTargetProject, 'put', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls/$controlId", $this.apiVersion, $body)
    }
     # Updates a control on the work item form
    [PSObject] EditControl([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $groupId, [string] $controlId) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls/$controlId", $this.apiVersion, $body)
    }
     # Removes a control from the work item form
    [PSObject] RemoveControlFromGroup([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $groupId, [string] $controlId) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/groups/$groupId/controls/$controlId", $this.apiVersion, $null)
    }

    # Updates a page on the work item form
    [PSObject] EditPage([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages", $this.apiVersion, $body)
    }
     # Adds a page to the work item form
    [PSObject] AddPage([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages", $this.apiVersion, $body)
    }

    # Removes a page from the work item form
    [PSObject] RemovePage([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $pageId) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages/$pageId", $this.apiVersion, $null)
    }

    # Adds a group to the work item form
    [PSObject] AddGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups", $this.apiVersion, $body)
    }

    # Moves a group to a different section
    [PSObject] SetGroupInSection([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId, [string] $groupId) {
        return $this.Request($useTargetProject, 'put', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups/$groupId", $this.apiVersion, $body)
    }
     # Updates a group in the work item form
    [PSObject] EditGroup([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId, [string] $groupId) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups/$groupId", $this.apiVersion, $body)
    }
     # Removes a group from the work item form
    [PSObject] RemoveGroup([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $pageId, [string] $sectionId, [string] $groupId) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workItemTypes/$witRefName/layout/pages/$pageId/sections/$sectionId/groups/$groupId", $this.apiVersion, $null)
    }

    # Returns a list of all state definitions in the work item type of the process.
    [PSObject] GetStateDefinitions([bool] $useTargetProject, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workItemTypes/$witRefName/states", $this.apiVersion, $null)
    }
     # Creates a state definition in the work item type of the process.
    [PSObject] CreateStateDefinition([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workItemTypes/$witRefName/states", $this.apiVersion, $body)
    }

    # Hides a state definition in the work item type of the process.
    [PSObject] HideStateDefinition([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'put', "work/processdefinitions/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $body)
    }
     # Updates a given state definition in the work item type of the process.
    [PSObject] UpdateStateDefinition([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $body)
    }
     # Removes a state definition in the work item type of the process.
    [PSObject] DeleteStateDefinition([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $null)
    }
     # Returns a state definition in the work item type of the process.
    [PSObject] GetStateDefinition([bool] $useTargetProject, [string] $processId, [string] $witRefName, [string] $stateId) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workItemTypes/$witRefName/states/$stateId", $this.apiVersion, $null)
    }

    # Updates a behavior for the work item type of the process.
    [PSObject] UpdateBehaviorToWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefNameForBehaviors) {
        return $this.Request($useTargetProject, 'patch', "work/processdefinitions/$processId/workitemtypes/$witRefNameForBehaviors/behaviors", $this.apiVersion, $body)
    }
     # Adds a behavior to the work item type of the process.
    [PSObject] AddBehaviorToWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefNameForBehaviors) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workitemtypes/$witRefNameForBehaviors/behaviors", $this.apiVersion, $body)
    }
     # Returns a list of all behaviors for the work item type of the process.
    [PSObject] GetBehaviorsForWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForBehaviors) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workitemtypes/$witRefNameForBehaviors/behaviors", $this.apiVersion, $null)
    }

    # Removes a behavior for the work item type of the process.
    [PSObject] RemoveBehaviorFromWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForBehaviors, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workitemtypes/$witRefNameForBehaviors/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }
     # Returns a behavior for the work item type of the process.
    [PSObject] GetBehaviorForWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForBehaviors, [string] $behaviorRefName) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workitemtypes/$witRefNameForBehaviors/behaviors/$behaviorRefName", $this.apiVersion, $null)
    }

    # Returns a list of all fields in the work item type of the process.
    [PSObject] GetWorkItemTypeFields([bool] $useTargetProject, [string] $processId, [string] $witRefNameForFields) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workItemTypes/$witRefNameForFields/fields", $this.apiVersion, $null)
    }
     # Adds a field to the work item type in the process.
    [PSObject] AddFieldToWorkItemType([bool] $useTargetProject, [PSObject] $body, [string] $processId, [string] $witRefNameForFields) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/$processId/workItemTypes/$witRefNameForFields/fields", $this.apiVersion, $body)
    }

    # Removes a field in the work item type of the process.
    [PSObject] RemoveFieldFromWorkItemType([bool] $useTargetProject, [string] $processId, [string] $witRefNameForFields, [string] $fieldRefName) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/$processId/workItemTypes/$witRefNameForFields/fields/$fieldRefName", $this.apiVersion, $null)
    }
     # Returns a single field in the work item type of the process.
    [PSObject] GetWorkItemTypeField([bool] $useTargetProject, [string] $processId, [string] $witRefNameForFields, [string] $fieldRefName) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/$processId/workItemTypes/$witRefNameForFields/fields/$fieldRefName", $this.apiVersion, $null)
    }

    # Creates a picklist.
    [PSObject] CreateList([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "work/processdefinitions/lists", $this.apiVersion, $body)
    }
     # Returns meta data of the picklist.
    [PSObject] GetListsMetadata([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/lists", $this.apiVersion, $null)
    }

    # Updates a list.
    [PSObject] UpdateList([bool] $useTargetProject, [PSObject] $body, [string] $listId) {
        return $this.Request($useTargetProject, 'put', "work/processdefinitions/lists/$listId", $this.apiVersion, $body)
    }
     # Removes a picklist.
    [PSObject] DeleteList([bool] $useTargetProject, [string] $listId) {
        return $this.Request($useTargetProject, 'delete', "work/processdefinitions/lists/$listId", $this.apiVersion, $null)
    }
     # Returns a picklist.
    [PSObject] GetList([bool] $useTargetProject, [string] $listId) {
        return $this.Request($useTargetProject, 'get', "work/processdefinitions/lists/$listId", $this.apiVersion, $null)
    }

}


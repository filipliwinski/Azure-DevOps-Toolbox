# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class WorkItemTrackingApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '4.1'

    # WorkItemTrackingApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WorkItemTrackingApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get the list of work item tracking outbound artifact link types.
    [PSObject] GetWorkArtifactLinkTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/artifactlinktypes", $this.apiVersion, $null)
    }

    # Get a list of all work item icons.
    [PSObject] GetWorkItemIcons([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitemicons", $this.apiVersion, $null)
    }

    # Get a work item icon given the friendly name and icon color.
    [PSObject] GetWorkItemIcon([bool] $useTargetProject, [string] $icon) {
        return $this.Request($useTargetProject, 'get', "wit/workitemicons/$icon", $this.apiVersion, $null)
    }

    # Gets the work item relation types.
    [PSObject] GetRelationTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitemrelationtypes", $this.apiVersion, $null)
    }

    # Gets the work item relation type definition.
    [PSObject] GetRelationType([bool] $useTargetProject, [string] $relation) {
        return $this.Request($useTargetProject, 'get', "wit/workitemrelationtypes/$relation", $this.apiVersion, $null)
    }

    # Returns the list of fully hydrated work item revisions, paged.
    [PSObject] GetRevisions([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$id/revisions", $this.apiVersion, $null)
    }

    # Returns a fully hydrated work item for the requested revision
    [PSObject] GetRevision([bool] $useTargetProject, [int] $id, [int] $revisionNumber) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$id/revisions/$revisionNumber", $this.apiVersion, $null)
    }

    # Returns a the deltas between work item revisions
    [PSObject] GetUpdates([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$id/updates", $this.apiVersion, $null)
    }

    # Returns a single update for a work item
    [PSObject] GetUpdate([bool] $useTargetProject, [int] $id, [int] $updateNumber) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$id/updates/$updateNumber", $this.apiVersion, $null)
    }

    # Returns the next state on the given work item IDs.
    [PSObject] GetWorkItemNextStatesOnCheckinAction([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtransitions", $this.apiVersion, $null)
    }

    # Queries work items linked to a given list of artifact URI.
    [PSObject] QueryWorkItemsForArtifactUris([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/artifacturiquery", $this.apiVersion, $body)
    }

    # Uploads an attachment.
    [PSObject] CreateAttachment([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/attachments", $this.apiVersion, $body)
    }

    # Downloads an attachment.
    [PSObject] GetAttachment([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "wit/attachments/$id", $this.apiVersion, $null)
    }

    # Gets root classification nodes under the project.
    [PSObject] GetRootNodes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/classificationnodes", $this.apiVersion, $null)
    }

    # Delete an existing classification node.
    [PSObject] DeleteClassificationNode([bool] $useTargetProject, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'delete', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $null)
    }
     # Update an existing classification node.
    [PSObject] UpdateClassificationNode([bool] $useTargetProject, [PSObject] $body, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'patch', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $body)
    }
     # Create new or update an existing classification node.
    [PSObject] CreateOrUpdateClassificationNode([bool] $useTargetProject, [PSObject] $body, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'post', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $body)
    }
     # Gets the classification node for a given node path.
    [PSObject] GetClassificationNode([bool] $useTargetProject, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'get', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $null)
    }

    # Returns information for all fields.
    [PSObject] GetFields([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/fields", $this.apiVersion, $null)
    }

    # Gets information on a specific field.
    [PSObject] GetField([bool] $useTargetProject, [string] $fieldNameOrRefName) {
        return $this.Request($useTargetProject, 'get', "wit/fields/$fieldNameOrRefName", $this.apiVersion, $null)
    }
     # Deletes the field.
    [PSObject] DeleteField([bool] $useTargetProject, [string] $fieldNameOrRefName) {
        return $this.Request($useTargetProject, 'delete', "wit/fields/$fieldNameOrRefName", $this.apiVersion, $null)
    }
     # Updates the field.
    [PSObject] UpdateField([bool] $useTargetProject, [PSObject] $body, [string] $fieldNameOrRefName) {
        return $this.Request($useTargetProject, 'patch', "wit/fields/$fieldNameOrRefName", $this.apiVersion, $body)
    }

    # Gets the root queries and their children
    [PSObject] GetQueries([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/queries", $this.apiVersion, $null)
    }

    # Delete a query or a folder. This deletes any permission change on the deleted query or folder and any of its descendants if it is a folder. It is important to note that the deleted permission changes cannot be recovered upon undeleting the query or folder.
    [PSObject] DeleteQuery([bool] $useTargetProject, [string] $query) {
        return $this.Request($useTargetProject, 'delete', "wit/queries/$query", $this.apiVersion, $null)
    }
     # Update a query or a folder. This allows you to update, rename and move queries and folders.
    [PSObject] UpdateQuery([bool] $useTargetProject, [PSObject] $body, [string] $query) {
        return $this.Request($useTargetProject, 'patch', "wit/queries/$query", $this.apiVersion, $body)
    }
     # Creates a query, or moves a query.
    [PSObject] CreateQuery([bool] $useTargetProject, [PSObject] $body, [string] $query) {
        return $this.Request($useTargetProject, 'post', "wit/queries/$query", $this.apiVersion, $body)
    }
     # Retrieves an individual query and its children
    [PSObject] GetQuery([bool] $useTargetProject, [string] $query) {
        return $this.Request($useTargetProject, 'get', "wit/queries/$query", $this.apiVersion, $null)
    }

    # Gets a list of the IDs and the URLs of the deleted the work items in the Recycle Bin.
    [PSObject] GetDeletedWorkItemShallowReferences([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/recyclebin", $this.apiVersion, $null)
    }

    # Gets a deleted work item from Recycle Bin.
    [PSObject] GetDeletedWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/recyclebin/$id", $this.apiVersion, $null)
    }
     # Destroys the specified work item permanently from the Recycle Bin. This action can not be undone.
    [PSObject] DestroyWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'delete', "wit/recyclebin/$id", $this.apiVersion, $null)
    }
     # Restores the deleted work item from Recycle Bin.
    [PSObject] RestoreWorkItem([bool] $useTargetProject, [PSObject] $body, [int] $id) {
        return $this.Request($useTargetProject, 'patch', "wit/recyclebin/$id", $this.apiVersion, $body)
    }

    # Get a batch of work item links
    [PSObject] GetReportingLinksByLinkType([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/reporting/workitemlinks", $this.apiVersion, $null)
    }

    # Get a batch of work item revisions with the option of including deleted items
    [PSObject] ReadReportingRevisionsGet([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/reporting/workitemrevisions", $this.apiVersion, $null)
    }
     # Get a batch of work item revisions. This request may be used if your list of fields is large enough that it may run the URL over the length limit.
    [PSObject] ReadReportingRevisionsPost([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/reporting/workitemrevisions", $this.apiVersion, $body)
    }

    # Returns a list of work items.
    [PSObject] GetWorkItems([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitems", $this.apiVersion, $null)
    }

    # Creates a single work item.
    [PSObject] CreateWorkItem([bool] $useTargetProject, [PSObject] $body, [string] $type) {
        return $this.Request($useTargetProject, 'post', "wit/workitems/$type", $this.apiVersion, $body)
    }
     # Returns a single work item from a template.
    [PSObject] GetWorkItemTemplate([bool] $useTargetProject, [string] $type) {
        return $this.Request($useTargetProject, 'get', "wit/workitems/$type", $this.apiVersion, $null)
    }

    # Returns a single work item.
    [PSObject] GetWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/workitems/$id", $this.apiVersion, $null)
    }
     # Deletes the specified work item and sends it to the Recycle Bin, so that it can be restored back, if required. Optionally, if the destroy parameter has been set to true, it destroys the work item permanently.
    [PSObject] DeleteWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'delete', "wit/workitems/$id", $this.apiVersion, $null)
    }
     # Updates a single work item.
    [PSObject] UpdateWorkItem([bool] $useTargetProject, [PSObject] $body, [int] $id) {
        return $this.Request($useTargetProject, 'patch', "wit/workitems/$id", $this.apiVersion, $body)
    }

    # Gets the specified number of comments for a work item from the specified revision.
    [PSObject] GetComments([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$id/comments", $this.apiVersion, $null)
    }

    # Gets a comment for a work item at the specified revision.
    [PSObject] GetComment([bool] $useTargetProject, [int] $id, [int] $revision) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$id/comments/$revision", $this.apiVersion, $null)
    }

    # Get all work item type categories.
    [PSObject] GetWorkItemTypeCategories([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypecategories", $this.apiVersion, $null)
    }

    # Get specific work item type category by name.
    [PSObject] GetWorkItemTypeCategory([bool] $useTargetProject, [string] $category) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypecategories/$category", $this.apiVersion, $null)
    }

    # Returns the list of work item types
    [PSObject] GetWorkItemTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypes", $this.apiVersion, $null)
    }

    # Returns a work item type definition.
    [PSObject] GetWorkItemType([bool] $useTargetProject, [string] $type) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypes/$type", $this.apiVersion, $null)
    }

    # Get a list of fields for a work item type with detailed references.
    [PSObject] GetWorkItemTypeFieldsWithReferences([bool] $useTargetProject, [string] $type) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypes/$type/fields", $this.apiVersion, $null)
    }

    # Get a field for a work item type with detailed references.
    [PSObject] GetWorkItemTypeFieldWithReferences([bool] $useTargetProject, [string] $type, [string] $field) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypes/$type/fields/$field", $this.apiVersion, $null)
    }

    # Returns the state names and colors for a work item type.
    [PSObject] GetWorkItemTypeStates([bool] $useTargetProject, [string] $type) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtypes/$type/states", $this.apiVersion, $null)
    }

    # Creates a template
    [PSObject] CreateTemplate([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/wit/templates", $this.apiVersion, $body)
    }
     # Gets template
    [PSObject] GetTemplates([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/wit/templates", $this.apiVersion, $null)
    }

    # Gets the template with specified id
    [PSObject] GetTemplate([bool] $useTargetProject, [string] $team, [string] $templateId) {
        return $this.Request($useTargetProject, 'get', "$team/wit/templates/$templateId", $this.apiVersion, $null)
    }
     # Deletes the template with given id
    [PSObject] DeleteTemplate([bool] $useTargetProject, [string] $team, [string] $templateId) {
        return $this.Request($useTargetProject, 'delete', "$team/wit/templates/$templateId", $this.apiVersion, $null)
    }
     # Replace template contents
    [PSObject] ReplaceTemplate([bool] $useTargetProject, [PSObject] $body, [string] $team, [string] $templateId) {
        return $this.Request($useTargetProject, 'put', "$team/wit/templates/$templateId", $this.apiVersion, $body)
    }

    # Gets the results of the query given its WIQL.
    [PSObject] QueryByWiql([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/wit/wiql", $this.apiVersion, $body)
    }

    # Gets the results of the query given the query ID.
    [PSObject] QueryById_Head([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'head', "$team/wit/wiql/$id", $this.apiVersion, $null)
    }
     # Gets the results of the query given the query ID.
    [PSObject] QueryById([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/wit/wiql/$id", $this.apiVersion, $null)
    }

}


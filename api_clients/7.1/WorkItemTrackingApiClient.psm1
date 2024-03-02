# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class WorkItemTrackingApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

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

    # Returns the next state on the given work item IDs.
    [PSObject] GetWorkItemNextStatesOnCheckinAction([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitemtransitions", $this.apiVersion, $null)
    }

    # Gets recent work item activities
    [PSObject] GetRecentActivityData([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/accountmyworkrecentactivity", $this.apiVersion, $null)
    }

    # Queries work items linked to a given list of artifact URI.
    [PSObject] QueryWorkItemsForArtifactUris([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/artifacturiquery", $this.apiVersion, $body)
    }

    # Uploads an attachment.On accounts with higher attachment upload limits (>130MB), you will need to use chunked upload.To upload an attachment in multiple chunks, you first need to [**Start a Chunked Upload**](#start_a_chunked_upload) and then follow the example from the **Upload Chunk** section.
    [PSObject] CreateAttachment([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/attachments", $this.apiVersion, $body)
    }

    # Uploads an attachment chunk.Before performing [**Upload a Chunk**](#upload-a-chunk), make sure to have an attachment id returned in **Start a Chunked Upload** example on **Create** section. Specify the byte range of the chunk using Content-Length. For example: "Content - Length": "bytes 0 - 39999 / 50000" for the first 40000 bytes of a 50000 byte file.
    [PSObject] UploadAttachment([bool] $useTargetProject, [PSObject] $body, [string] $id) {
        return $this.Request($useTargetProject, 'put', "wit/attachments/$id", $this.apiVersion, $body)
    }
     # Downloads an attachment.
    [PSObject] GetAttachment([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "wit/attachments/$id", $this.apiVersion, $null)
    }

    # Gets root classification nodes under the project.
    [PSObject] GetRootNodes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/classificationnodes", $this.apiVersion, $null)
    }

    # Gets the classification node for a given node path.
    [PSObject] GetClassificationNode([bool] $useTargetProject, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'get', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $null)
    }
     # Update an existing classification node.
    [PSObject] UpdateClassificationNode([bool] $useTargetProject, [PSObject] $body, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'patch', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $body)
    }
     # Create new or update an existing classification node.
    [PSObject] CreateOrUpdateClassificationNode([bool] $useTargetProject, [PSObject] $body, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'post', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $body)
    }
     # Delete an existing classification node.
    [PSObject] DeleteClassificationNode([bool] $useTargetProject, [string] $structureGroup, [string] $path) {
        return $this.Request($useTargetProject, 'delete', "wit/classificationnodes/$structureGroup/$path", $this.apiVersion, $null)
    }

    # Returns information for all fields. The project ID/name parameter is optional.
    [PSObject] GetWorkItemFields([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/fields", $this.apiVersion, $null)
    }
     # Create a new field.
    [PSObject] CreateWorkItemField([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/fields", $this.apiVersion, $body)
    }

    # Update a field.
    [PSObject] UpdateWorkItemField([bool] $useTargetProject, [PSObject] $body, [string] $fieldNameOrRefName) {
        return $this.Request($useTargetProject, 'patch', "wit/fields/$fieldNameOrRefName", $this.apiVersion, $body)
    }
     # Deletes the field. To undelete a filed, see "Update Field" API.
    [PSObject] DeleteWorkItemField([bool] $useTargetProject, [string] $fieldNameOrRefName) {
        return $this.Request($useTargetProject, 'delete', "wit/fields/$fieldNameOrRefName", $this.apiVersion, $null)
    }
     # Gets information on a specific field.
    [PSObject] GetWorkItemField([bool] $useTargetProject, [string] $fieldNameOrRefName) {
        return $this.Request($useTargetProject, 'get', "wit/fields/$fieldNameOrRefName", $this.apiVersion, $null)
    }

    # Migrates a project to a different process within the same OOB type. For example, you can only migrate a project from agile/custom-agile to agile/custom-agile.
    [PSObject] MigrateProjectsProcess([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/projectprocessmigration", $this.apiVersion, $body)
    }

    # Gets the root queries and their children
    [PSObject] GetQueries([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/queries", $this.apiVersion, $null)
    }

    # Retrieves an individual query and its children
    [PSObject] GetQuery([bool] $useTargetProject, [string] $query) {
        return $this.Request($useTargetProject, 'get', "wit/queries/$query", $this.apiVersion, $null)
    }
     # Update a query or a folder. This allows you to update, rename and move queries and folders.
    [PSObject] UpdateQuery([bool] $useTargetProject, [PSObject] $body, [string] $query) {
        return $this.Request($useTargetProject, 'patch', "wit/queries/$query", $this.apiVersion, $body)
    }
     # Creates a query, or moves a query.Learn more about Work Item Query Language (WIQL) syntax [here](https://docs.microsoft.com/en-us/vsts/collaborate/wiql-syntax?toc=/vsts/work/track/toc.json&bc=/vsts/work/track/breadcrumb/toc.json&view=vsts).
    [PSObject] CreateQuery([bool] $useTargetProject, [PSObject] $body, [string] $query) {
        return $this.Request($useTargetProject, 'post', "wit/queries/$query", $this.apiVersion, $body)
    }
     # Delete a query or a folder. This deletes any permission change on the deleted query or folder and any of its descendants if it is a folder. It is important to note that the deleted permission changes cannot be recovered upon undeleting the query or folder.
    [PSObject] DeleteQuery([bool] $useTargetProject, [string] $query) {
        return $this.Request($useTargetProject, 'delete', "wit/queries/$query", $this.apiVersion, $null)
    }

    # Gets a list of queries by ids (Maximum 1000)
    [PSObject] GetQueriesBatch([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/queriesbatch", $this.apiVersion, $body)
    }

    # Gets a list of the IDs and the URLs of the deleted the work items in the Recycle Bin.
    [PSObject] GetDeletedWorkItemShallowReferences([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/recyclebin", $this.apiVersion, $null)
    }

    # Restores the deleted work item from Recycle Bin.
    [PSObject] RestoreWorkItem([bool] $useTargetProject, [PSObject] $body, [int] $id) {
        return $this.Request($useTargetProject, 'patch', "wit/recyclebin/$id", $this.apiVersion, $body)
    }
     # Destroys the specified work item permanently from the Recycle Bin. This action can not be undone.
    [PSObject] DestroyWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'delete', "wit/recyclebin/$id", $this.apiVersion, $null)
    }
     # Gets a deleted work item from Recycle Bin.
    [PSObject] GetDeletedWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/recyclebin/$id", $this.apiVersion, $null)
    }

    # Get a batch of work item links
    [PSObject] GetReportingLinksByLinkType([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/reporting/workitemlinks", $this.apiVersion, $null)
    }

    # Get a batch of work item revisions. This request may be used if your list of fields is large enough that it may run the URL over the length limit.
    [PSObject] ReadReportingRevisionsPost([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/reporting/workitemrevisions", $this.apiVersion, $body)
    }
     # Get a batch of work item revisions with the option of including deleted items
    [PSObject] ReadReportingRevisionsGet([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/reporting/workitemrevisions", $this.apiVersion, $null)
    }

    # empty
    [PSObject] ReadReportingDiscussions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/reporting/workItemRevisions/discussions", $this.apiVersion, $null)
    }

    # RESTful method to send mail for selected/queried work items.
    [PSObject] SendMailAsync([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/sendmail", $this.apiVersion, $body)
    }

    # Get all the tags for the project.
    [PSObject] GetTags([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/tags", $this.apiVersion, $null)
    }

    # Update the tag for the project.
    [PSObject] UpdateTag([bool] $useTargetProject, [PSObject] $body, [string] $tagIdOrName) {
        return $this.Request($useTargetProject, 'patch', "wit/tags/$tagIdOrName", $this.apiVersion, $body)
    }
     # Delete the tag for the project. Please note, that the deleted tag will be removed from all Work Items as well as Pull Requests.
    [PSObject] DeleteTag([bool] $useTargetProject, [string] $tagIdOrName) {
        return $this.Request($useTargetProject, 'delete', "wit/tags/$tagIdOrName", $this.apiVersion, $null)
    }
     # Get the tag for the project.
    [PSObject] GetTag([bool] $useTargetProject, [string] $tagIdOrName) {
        return $this.Request($useTargetProject, 'get', "wit/tags/$tagIdOrName", $this.apiVersion, $null)
    }

    # Creates a temporary queryLearn more about Work Item Query Language (WIQL) syntax [here](https://docs.microsoft.com/en-us/vsts/collaborate/wiql-syntax?toc=/vsts/work/track/toc.json&bc=/vsts/work/track/breadcrumb/toc.json&view=vsts).
    [PSObject] CreateTempQuery([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/tempqueries", $this.apiVersion, $body)
    }

    # Returns a list of work items (Maximum 200)
    [PSObject] GetWorkItems([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wit/workitems", $this.apiVersion, $null)
    }

    # Returns a single work item from a template.
    [PSObject] GetWorkItemTemplate([bool] $useTargetProject, [string] $type) {
        return $this.Request($useTargetProject, 'get', "wit/workitems/$type", $this.apiVersion, $null)
    }
     # Creates a single work item.
    [PSObject] CreateWorkItem([bool] $useTargetProject, [PSObject] $body, [string] $type) {
        return $this.Request($useTargetProject, 'post', "wit/workitems/$type", $this.apiVersion, $body)
    }

    # Updates a single work item.
    [PSObject] UpdateWorkItem([bool] $useTargetProject, [PSObject] $body, [int] $id) {
        return $this.Request($useTargetProject, 'patch', "wit/workitems/$id", $this.apiVersion, $body)
    }
     # Deletes the specified work item and sends it to the Recycle Bin, so that it can be restored back, if required. Optionally, if the destroy parameter has been set to true, it destroys the work item permanently. WARNING: If the destroy parameter is set to true, work items deleted by this command will NOT go to recycle-bin and there is no way to restore/recover them after deletion. It is recommended NOT to use this parameter. If you do, please use this parameter with extreme caution.
    [PSObject] DeleteWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'delete', "wit/workitems/$id", $this.apiVersion, $null)
    }
     # Returns a single work item.
    [PSObject] GetWorkItem([bool] $useTargetProject, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wit/workitems/$id", $this.apiVersion, $null)
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

    # Returns a list of work item comments by ids.
    [PSObject] GetCommentsBatch([bool] $useTargetProject, [int] $workItemId) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$workItemId/comments", $this.apiVersion, $null)
    }
     # Add a comment on a work item.
    [PSObject] AddComment([bool] $useTargetProject, [PSObject] $body, [int] $workItemId) {
        return $this.Request($useTargetProject, 'post', "wit/workItems/$workItemId/comments", $this.apiVersion, $body)
    }

    # Update a comment on a work item.
    [PSObject] UpdateComment([bool] $useTargetProject, [PSObject] $body, [int] $workItemId, [int] $commentId) {
        return $this.Request($useTargetProject, 'patch', "wit/workItems/$workItemId/comments/$commentId", $this.apiVersion, $body)
    }
     # Delete a comment on a work item.
    [PSObject] DeleteComment([bool] $useTargetProject, [int] $workItemId, [int] $commentId) {
        return $this.Request($useTargetProject, 'delete', "wit/workItems/$workItemId/comments/$commentId", $this.apiVersion, $null)
    }
     # Returns a work item comment.
    [PSObject] GetComment([bool] $useTargetProject, [int] $workItemId, [int] $commentId) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$workItemId/comments/$commentId", $this.apiVersion, $null)
    }

    # Gets reactions of a comment.
    [PSObject] GetCommentReactions([bool] $useTargetProject, [int] $workItemId, [int] $commentId) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$workItemId/comments/$commentId/reactions", $this.apiVersion, $null)
    }

    # Deletes an existing reaction on a comment.
    [PSObject] DeleteCommentReaction([bool] $useTargetProject, [int] $workItemId, [int] $commentId, [string] $reactionType) {
        return $this.Request($useTargetProject, 'delete', "wit/workItems/$workItemId/comments/$commentId/reactions/$reactionType", $this.apiVersion, $null)
    }
     # Adds a new reaction to a comment.
    [PSObject] CreateCommentReaction([bool] $useTargetProject, [int] $workItemId, [int] $commentId, [string] $reactionType) {
        return $this.Request($useTargetProject, 'put', "wit/workItems/$workItemId/comments/$commentId/reactions/$reactionType", $this.apiVersion, $null)
    }

    # Get users who reacted on the comment.
    [PSObject] GetEngagedUsers([bool] $useTargetProject, [int] $workItemId, [int] $commentId, [string] $reactionType) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$workItemId/comments/$commentId/reactions/$reactionType/users", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetCommentVersions([bool] $useTargetProject, [int] $workItemId, [int] $commentId) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$workItemId/comments/$commentId/versions", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetCommentVersion([bool] $useTargetProject, [int] $workItemId, [int] $commentId, [int] $version) {
        return $this.Request($useTargetProject, 'get', "wit/workItems/$workItemId/comments/$commentId/versions/$version", $this.apiVersion, $null)
    }

    # Gets work items for a list of work item ids (Maximum 200)
    [PSObject] GetWorkItemsBatch([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/workitemsbatch", $this.apiVersion, $body)
    }

    # Deletes specified work items and sends them to the Recycle Bin, so that it can be restored back, if required. Optionally, if the destroy parameter has been set to true, it destroys the work item permanently. WARNING: If the destroy parameter is set to true, work items deleted by this command will NOT go to recycle-bin and there is no way to restore/recover them after deletion.
    [PSObject] DeleteWorkItems([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wit/workitemsdelete", $this.apiVersion, $body)
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

    # Gets template
    [PSObject] GetTemplates([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/wit/templates", $this.apiVersion, $null)
    }
     # Creates a template
    [PSObject] CreateTemplate([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/wit/templates", $this.apiVersion, $body)
    }

    # Replace template contents
    [PSObject] ReplaceTemplate([bool] $useTargetProject, [PSObject] $body, [string] $team, [string] $templateId) {
        return $this.Request($useTargetProject, 'put', "$team/wit/templates/$templateId", $this.apiVersion, $body)
    }
     # Deletes the template with given id
    [PSObject] DeleteTemplate([bool] $useTargetProject, [string] $team, [string] $templateId) {
        return $this.Request($useTargetProject, 'delete', "$team/wit/templates/$templateId", $this.apiVersion, $null)
    }
     # Gets the template with specified id
    [PSObject] GetTemplate([bool] $useTargetProject, [string] $team, [string] $templateId) {
        return $this.Request($useTargetProject, 'get', "$team/wit/templates/$templateId", $this.apiVersion, $null)
    }

    # Gets the results of the query given its WIQL.
    [PSObject] QueryByWiql([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/wit/wiql", $this.apiVersion, $body)
    }

    # Gets the results of the query given the query ID.
    [PSObject] QueryById([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/wit/wiql/$id", $this.apiVersion, $null)
    }
     # Gets the results of the query given the query ID.
    [PSObject] QueryById_Head([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'head', "$team/wit/wiql/$id", $this.apiVersion, $null)
    }

}


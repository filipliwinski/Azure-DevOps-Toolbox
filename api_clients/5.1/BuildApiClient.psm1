# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class BuildApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1'

    # BuildApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    BuildApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Gets controller, optionally filtered by name
    [PSObject] GetBuildControllers([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/controllers", $this.apiVersion, $null)
    }

    # Gets a controller
    [PSObject] GetBuildController([bool] $useTargetProject, [int] $controllerId) {
        return $this.Request($useTargetProject, 'get', "build/controllers/$controllerId", $this.apiVersion, $null)
    }

    # Gets information about build resources in the system.
    [PSObject] GetResourceUsage([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/resourceusage", $this.apiVersion, $null)
    }

    # This endpoint is deprecated. Please see the Build Status REST endpoint.
    [PSObject] GetBadge([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "public/build/definitions//$definitionId/badge", $this.apiVersion, $null)
    }

    # empty
    [PSObject] AuthorizeProjectResources([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "build/authorizedresources", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetProjectResources([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/authorizedresources", $this.apiVersion, $null)
    }

    # Queues a build
    [PSObject] QueueBuild([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "build/builds", $this.apiVersion, $body)
    }
     # Gets a list of builds.
    [PSObject] GetBuilds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/builds", $this.apiVersion, $null)
    }
     # Updates multiple builds.
    [PSObject] UpdateBuilds([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "build/builds", $this.apiVersion, $body)
    }

    # Gets a build
    [PSObject] GetBuild([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId", $this.apiVersion, $null)
    }
     # Deletes a build.
    [PSObject] DeleteBuild([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'delete', "build/builds/$buildId", $this.apiVersion, $null)
    }
     # Updates a build.
    [PSObject] UpdateBuild([bool] $useTargetProject, [PSObject] $body, [int] $buildId) {
        return $this.Request($useTargetProject, 'patch', "build/builds/$buildId", $this.apiVersion, $body)
    }

    # Gets a specific attachment.
    [PSObject] GetAttachment([bool] $useTargetProject, [int] $buildId, [string] $timelineId, [string] $recordId, [string] $type, [string] $name) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/$timelineId/$recordId/attachments/$type/$name", $this.apiVersion, $null)
    }

    # Associates an artifact with a build.
    [PSObject] CreateArtifact([bool] $useTargetProject, [PSObject] $body, [int] $buildId) {
        return $this.Request($useTargetProject, 'post', "build/builds/$buildId/artifacts", $this.apiVersion, $body)
    }
     # Gets all artifacts for a build.
    [PSObject] GetArtifacts([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/artifacts", $this.apiVersion, $null)
    }

    # Gets the list of attachments of a specific type that are associated with a build.
    [PSObject] GetAttachments([bool] $useTargetProject, [int] $buildId, [string] $type) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/attachments/$type", $this.apiVersion, $null)
    }

    # Gets the changes associated with a build
    [PSObject] GetBuildChanges([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/changes", $this.apiVersion, $null)
    }

    # Gets the logs for a build.
    [PSObject] GetBuildLogs([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/logs", $this.apiVersion, $null)
    }

    # Gets an individual log file for a build.
    [PSObject] GetBuildLog([bool] $useTargetProject, [int] $buildId, [int] $logId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/logs/$logId", $this.apiVersion, $null)
    }

    # Gets properties for a build.
    [PSObject] GetBuildProperties([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/properties", $this.apiVersion, $null)
    }
     # Updates properties for a build.
    [PSObject] UpdateBuildProperties([bool] $useTargetProject, [PSObject] $body, [int] $buildId) {
        return $this.Request($useTargetProject, 'patch', "build/builds/$buildId/properties", $this.apiVersion, $body)
    }

    # Gets a build report.
    [PSObject] GetBuildReport([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/report", $this.apiVersion, $null)
    }

    # Adds tags to a build.
    [PSObject] AddBuildTags([bool] $useTargetProject, [PSObject] $body, [int] $buildId) {
        return $this.Request($useTargetProject, 'post', "build/builds/$buildId/tags", $this.apiVersion, $body)
    }
     # Gets the tags for a build.
    [PSObject] GetBuildTags([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/tags", $this.apiVersion, $null)
    }

    # Adds a tag to a build.
    [PSObject] AddBuildTag([bool] $useTargetProject, [int] $buildId, [string] $tag) {
        return $this.Request($useTargetProject, 'put', "build/builds/$buildId/tags/$tag", $this.apiVersion, $null)
    }
     # Removes a tag from a build.
    [PSObject] DeleteBuildTag([bool] $useTargetProject, [int] $buildId, [string] $tag) {
        return $this.Request($useTargetProject, 'delete', "build/builds/$buildId/tags/$tag", $this.apiVersion, $null)
    }

    # Gets details for a build
    [PSObject] GetBuildTimeline([bool] $useTargetProject, [int] $buildId, [string] $timelineId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/timeline/$timelineId", $this.apiVersion, $null)
    }

    # Gets the work items associated with a build.
    [PSObject] GetBuildWorkItemsRefs([bool] $useTargetProject, [int] $buildId) {
        return $this.Request($useTargetProject, 'get', "build/builds/$buildId/workitems", $this.apiVersion, $null)
    }
     # Gets the work items associated with a build, filtered to specific commits.
    [PSObject] GetBuildWorkItemsRefsFromCommits([bool] $useTargetProject, [PSObject] $body, [int] $buildId) {
        return $this.Request($useTargetProject, 'post', "build/builds/$buildId/workitems", $this.apiVersion, $body)
    }

    # Gets the changes made to the repository between two given builds.
    [PSObject] GetChangesBetweenBuilds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/changes", $this.apiVersion, $null)
    }

    # Creates a new definition.
    [PSObject] CreateDefinition([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "build/definitions", $this.apiVersion, $body)
    }
     # Gets a list of definitions.
    [PSObject] GetDefinitions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/definitions", $this.apiVersion, $null)
    }

    # Gets a definition, optionally at a specific revision.
    [PSObject] GetDefinition([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/$definitionId", $this.apiVersion, $null)
    }
     # Updates an existing definition.
    [PSObject] UpdateDefinition([bool] $useTargetProject, [PSObject] $body, [int] $definitionId) {
        return $this.Request($useTargetProject, 'put', "build/definitions/$definitionId", $this.apiVersion, $body)
    }
     # Deletes a definition and all associated builds.
    [PSObject] DeleteDefinition([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'delete', "build/definitions/$definitionId", $this.apiVersion, $null)
    }
     # Restores a deleted definition
    [PSObject] RestoreDefinition([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'patch', "build/definitions/$definitionId", $this.apiVersion, $null)
    }

    # Gets build metrics for a definition.
    [PSObject] GetDefinitionMetrics([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/$definitionId/metrics", $this.apiVersion, $null)
    }

    # Gets properties for a definition.
    [PSObject] GetDefinitionProperties([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/$definitionId/properties", $this.apiVersion, $null)
    }
     # Updates properties for a definition.
    [PSObject] UpdateDefinitionProperties([bool] $useTargetProject, [PSObject] $body, [int] $definitionId) {
        return $this.Request($useTargetProject, 'patch', "build/definitions/$definitionId/properties", $this.apiVersion, $body)
    }

    # empty
    [PSObject] AuthorizeDefinitionResources([bool] $useTargetProject, [PSObject] $body, [int] $definitionId) {
        return $this.Request($useTargetProject, 'patch', "build/definitions/$definitionId/resources", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetDefinitionResources([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/$definitionId/resources", $this.apiVersion, $null)
    }

    # Gets all revisions of a definition.
    [PSObject] GetDefinitionRevisions([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/$definitionId/revisions", $this.apiVersion, $null)
    }

    # Adds multiple tags to a definition.
    [PSObject] AddDefinitionTags([bool] $useTargetProject, [PSObject] $body, [int] $definitionId) {
        return $this.Request($useTargetProject, 'post', "build/definitions/$DefinitionId/tags", $this.apiVersion, $body)
    }
     # Gets the tags for a definition.
    [PSObject] GetDefinitionTags([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/$DefinitionId/tags", $this.apiVersion, $null)
    }

    # Adds a tag to a definition
    [PSObject] AddDefinitionTag([bool] $useTargetProject, [int] $definitionId, [string] $tag) {
        return $this.Request($useTargetProject, 'put', "build/definitions/$DefinitionId/tags/$tag", $this.apiVersion, $null)
    }
     # Removes a tag from a definition.
    [PSObject] DeleteDefinitionTag([bool] $useTargetProject, [int] $definitionId, [string] $tag) {
        return $this.Request($useTargetProject, 'delete', "build/definitions/$DefinitionId/tags/$tag", $this.apiVersion, $null)
    }

    # Gets all definition templates.
    [PSObject] GetTemplates([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/definitions/templates", $this.apiVersion, $null)
    }

    # Gets a specific build definition template.
    [PSObject] GetTemplate([bool] $useTargetProject, [string] $templateId) {
        return $this.Request($useTargetProject, 'get', "build/definitions/templates/$templateId", $this.apiVersion, $null)
    }
     # Deletes a build definition template.
    [PSObject] DeleteTemplate([bool] $useTargetProject, [string] $templateId) {
        return $this.Request($useTargetProject, 'delete', "build/definitions/templates/$templateId", $this.apiVersion, $null)
    }
     # Updates an existing build definition template.
    [PSObject] SaveTemplate([bool] $useTargetProject, [PSObject] $body, [string] $templateId) {
        return $this.Request($useTargetProject, 'put', "build/definitions/templates/$templateId", $this.apiVersion, $body)
    }

    # Deletes a definition folder. Definitions and their corresponding builds will also be deleted.
    [PSObject] DeleteFolder([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "build/folders", $this.apiVersion, $null)
    }
     # Creates a new folder.
    [PSObject] CreateFolder([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'put', "build/folders", $this.apiVersion, $body)
    }
     # Updates an existing folder at given  existing path
    [PSObject] UpdateFolder([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "build/folders", $this.apiVersion, $body)
    }

    # Gets a list of build definition folders.
    [PSObject] GetFolders([bool] $useTargetProject, [string] $path) {
        return $this.Request($useTargetProject, 'get', "build/folders/$path", $this.apiVersion, $null)
    }

    # Gets the latest build for a definition, optionally scoped to a specific branch.
    [PSObject] GetLatestBuild([bool] $useTargetProject, [string] $definition) {
        return $this.Request($useTargetProject, 'get', "build/latest/$definition", $this.apiVersion, $null)
    }

    # Gets build metrics for a project.
    [PSObject] GetProjectMetrics([bool] $useTargetProject, [string] $metricAggregationType) {
        return $this.Request($useTargetProject, 'get', "build/metrics/$metricAggregationType", $this.apiVersion, $null)
    }

    # Gets all build definition options supported by the system.
    [PSObject] GetBuildOptionDefinitions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/options", $this.apiVersion, $null)
    }

    # Gets a badge that indicates the status of the most recent build for the specified branch.
    [PSObject] GetBuildBadge([bool] $useTargetProject, [string] $repoType) {
        return $this.Request($useTargetProject, 'get', "build/repos/$repoType/badge", $this.apiVersion, $null)
    }

    # Gets the build settings.
    [PSObject] GetBuildSettings([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/settings", $this.apiVersion, $null)
    }
     # Updates the build settings.
    [PSObject] UpdateBuildSettings([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "build/settings", $this.apiVersion, $body)
    }

    # <p>Gets the build status for a definition, optionally scoped to a specific branch, stage, job, and configuration.</p> <p>If there are more than one, then it is required to pass in a stageName value when specifying a jobName, and the same rule then applies for both if passing a configuration parameter.</p>
    [PSObject] GetStatusBadge([bool] $useTargetProject, [string] $definition) {
        return $this.Request($useTargetProject, 'get', "build/status/$definition", $this.apiVersion, $null)
    }

    # Gets a list of all build and definition tags in the project.
    [PSObject] GetTags([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/tags", $this.apiVersion, $null)
    }

    # Gets all the work items between two builds.
    [PSObject] GetWorkItemsBetweenBuilds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "build/workitems", $this.apiVersion, $null)
    }

    # Get a list of source providers and their capabilities.
    [PSObject] ListSourceProviders([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "sourceproviders", $this.apiVersion, $null)
    }

    # Gets a list of branches for the given source code repository.
    [PSObject] ListBranches([bool] $useTargetProject, [string] $providerName) {
        return $this.Request($useTargetProject, 'get', "sourceProviders/$providerName/branches", $this.apiVersion, $null)
    }

    # Gets the contents of a file in the given source code repository.
    [PSObject] GetFileContents([bool] $useTargetProject, [string] $providerName) {
        return $this.Request($useTargetProject, 'get', "sourceProviders/$providerName/filecontents", $this.apiVersion, $null)
    }

    # Gets the contents of a directory in the given source code repository.
    [PSObject] GetPathContents([bool] $useTargetProject, [string] $providerName) {
        return $this.Request($useTargetProject, 'get', "sourceProviders/$providerName/pathcontents", $this.apiVersion, $null)
    }

    # Gets a pull request object from source provider.
    [PSObject] GetPullRequest([bool] $useTargetProject, [string] $providerName, [string] $pullRequestId) {
        return $this.Request($useTargetProject, 'get', "sourceProviders/$providerName/pullrequests/$pullRequestId", $this.apiVersion, $null)
    }

    # Gets a list of source code repositories.
    [PSObject] ListRepositories([bool] $useTargetProject, [string] $providerName) {
        return $this.Request($useTargetProject, 'get', "sourceProviders/$providerName/repositories", $this.apiVersion, $null)
    }

    # Recreates the webhooks for the specified triggers in the given source code repository.
    [PSObject] RestoreWebhooks([bool] $useTargetProject, [PSObject] $body, [string] $providerName) {
        return $this.Request($useTargetProject, 'post', "sourceProviders/$providerName/webhooks", $this.apiVersion, $body)
    }
     # Gets a list of webhooks installed in the given source code repository.
    [PSObject] ListWebhooks([bool] $useTargetProject, [string] $providerName) {
        return $this.Request($useTargetProject, 'get', "sourceProviders/$providerName/webhooks", $this.apiVersion, $null)
    }

}


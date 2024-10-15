# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class ReleaseApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # ReleaseApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ReleaseApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of approvals
    [PSObject] GetApprovals([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "release/approvals", $this.apiVersion, $null)
    }

    # Update status of an approval
    [PSObject] UpdateReleaseApproval([bool] $useTargetProject, [PSObject] $body, [int] $approvalId) {
        return $this.Request($useTargetProject, 'patch', "release/approvals/$approvalId", $this.apiVersion, $body)
    }

    # Update a release definition.
    [PSObject] UpdateReleaseDefinition([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'put', "release/definitions", $this.apiVersion, $body)
    }
     # Get a list of release definitions.
    [PSObject] GetReleaseDefinitions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "release/definitions", $this.apiVersion, $null)
    }
     # Create a release definition
    [PSObject] CreateReleaseDefinition([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "release/definitions", $this.apiVersion, $body)
    }

    # Delete a release definition.
    [PSObject] DeleteReleaseDefinition([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'delete', "release/definitions/$definitionId", $this.apiVersion, $null)
    }
     # Get a release definition.
    [PSObject] GetReleaseDefinition([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "release/definitions/$definitionId", $this.apiVersion, $null)
    }

    # Get revision history for a release definition
    [PSObject] GetReleaseDefinitionHistory([bool] $useTargetProject, [int] $definitionId) {
        return $this.Request($useTargetProject, 'get', "Release/definitions/$definitionId/revisions", $this.apiVersion, $null)
    }

    # Get release definition for a given definitionId and revision
    [PSObject] GetDefinitionRevision([bool] $useTargetProject, [int] $definitionId, [int] $revision) {
        return $this.Request($useTargetProject, 'get', "Release/definitions/$definitionId/revisions/$revision", $this.apiVersion, $null)
    }

    # Get a list of deployments
    [PSObject] GetDeployments([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "release/deployments", $this.apiVersion, $null)
    }

    # Gets folders.
    [PSObject] GetFolders([bool] $useTargetProject, [string] $path) {
        return $this.Request($useTargetProject, 'get', "release/folders/$path", $this.apiVersion, $null)
    }
     # Updates an existing folder at given existing path.
    [PSObject] UpdateFolder([bool] $useTargetProject, [PSObject] $body, [string] $path) {
        return $this.Request($useTargetProject, 'patch', "release/folders/$path", $this.apiVersion, $body)
    }
     # Deletes a definition folder for given folder name and path and all it's existing definitions.
    [PSObject] DeleteFolder([bool] $useTargetProject, [string] $path) {
        return $this.Request($useTargetProject, 'delete', "release/folders/$path", $this.apiVersion, $null)
    }
     # This method is no longer supported. Use CreateFolder with folder parameter API.
    [PSObject] CreateFolder([bool] $useTargetProject, [PSObject] $body, [string] $path) {
        return $this.Request($useTargetProject, 'post', "release/folders/$path", $this.apiVersion, $body)
    }

    # Updates the gate for a deployment.
    [PSObject] UpdateGates([bool] $useTargetProject, [PSObject] $body, [int] $gateStepId) {
        return $this.Request($useTargetProject, 'patch', "release/gates/$gateStepId", $this.apiVersion, $body)
    }

    # Get a list of releases
    [PSObject] GetReleases([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "release/releases", $this.apiVersion, $null)
    }
     # Create a release.
    [PSObject] CreateRelease([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "release/releases", $this.apiVersion, $body)
    }

    # Update few properties of a release.
    [PSObject] UpdateReleaseResource([bool] $useTargetProject, [PSObject] $body, [int] $releaseId) {
        return $this.Request($useTargetProject, 'patch', "release/releases/$releaseId", $this.apiVersion, $body)
    }
     # Update a complete release object.
    [PSObject] UpdateRelease([bool] $useTargetProject, [PSObject] $body, [int] $releaseId) {
        return $this.Request($useTargetProject, 'put', "release/releases/$releaseId", $this.apiVersion, $body)
    }
     # Get release for a given revision number.
    [PSObject] GetReleaseRevision([bool] $useTargetProject, [int] $releaseId) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId", $this.apiVersion, $null)
    }

    # Get a release environment.
    [PSObject] GetReleaseEnvironment([bool] $useTargetProject, [int] $releaseId, [int] $environmentId) {
        return $this.Request($useTargetProject, 'get', "Release/releases/$releaseId/environments/$environmentId", $this.apiVersion, $null)
    }
     # Update the status of a release environment
    [PSObject] UpdateReleaseEnvironment([bool] $useTargetProject, [PSObject] $body, [int] $releaseId, [int] $environmentId) {
        return $this.Request($useTargetProject, 'patch', "Release/releases/$releaseId/environments/$environmentId", $this.apiVersion, $body)
    }

    # Get the release task attachments.
    [PSObject] GetReleaseTaskAttachments([bool] $useTargetProject, [int] $releaseId, [int] $environmentId, [int] $attemptId, [string] $planId, [string] $type) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId/environments/$environmentId/attempts/$attemptId/plan/$planId/attachments/$type", $this.apiVersion, $null)
    }

    # Get a release task attachment.
    [PSObject] GetReleaseTaskAttachmentContent([bool] $useTargetProject, [int] $releaseId, [int] $environmentId, [int] $attemptId, [string] $planId, [string] $timelineId, [string] $recordId, [string] $type, [string] $name) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId/environments/$environmentId/attempts/$attemptId/plan/$planId/timelines/$timelineId/records/$recordId/attachments/$type/$name", $this.apiVersion, $null)
    }

    # GetTaskAttachments API is deprecated. Use GetReleaseTaskAttachments API instead.
    [PSObject] GetTaskAttachments([bool] $useTargetProject, [int] $releaseId, [int] $environmentId, [int] $attemptId, [string] $timelineId, [string] $type) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId/environments/$environmentId/attempts/$attemptId/timelines/$timelineId/attachments/$type", $this.apiVersion, $null)
    }

    # GetTaskAttachmentContent API is deprecated. Use GetReleaseTaskAttachmentContent API instead.
    [PSObject] GetTaskAttachmentContent([bool] $useTargetProject, [int] $releaseId, [int] $environmentId, [int] $attemptId, [string] $timelineId, [string] $recordId, [string] $type, [string] $name) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId/environments/$environmentId/attempts/$attemptId/timelines/$timelineId/records/$recordId/attachments/$type/$name", $this.apiVersion, $null)
    }

    # Gets the task log of a release as a plain text file.
    [PSObject] GetTaskLog([bool] $useTargetProject, [int] $releaseId, [int] $environmentId, [int] $releaseDeployPhaseId, [int] $taskId) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId/environments/$environmentId/deployPhases/$releaseDeployPhaseId/tasks/$taskId/logs", $this.apiVersion, $null)
    }

    # Get logs for a release Id.
    [PSObject] GetLogs([bool] $useTargetProject, [int] $releaseId) {
        return $this.Request($useTargetProject, 'get', "release/releases/$releaseId/logs", $this.apiVersion, $null)
    }

    # List all manual interventions for a given release.
    [PSObject] GetManualInterventions([bool] $useTargetProject, [int] $releaseId) {
        return $this.Request($useTargetProject, 'get', "Release/releases/$releaseId/manualinterventions", $this.apiVersion, $null)
    }

    # Get manual intervention for a given release and manual intervention id.
    [PSObject] GetManualIntervention([bool] $useTargetProject, [int] $releaseId, [int] $manualInterventionId) {
        return $this.Request($useTargetProject, 'get', "Release/releases/$releaseId/manualinterventions/$manualInterventionId", $this.apiVersion, $null)
    }
     # Update manual intervention.
    [PSObject] UpdateManualIntervention([bool] $useTargetProject, [PSObject] $body, [int] $releaseId, [int] $manualInterventionId) {
        return $this.Request($useTargetProject, 'patch', "Release/releases/$releaseId/manualinterventions/$manualInterventionId", $this.apiVersion, $body)
    }

}


# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class AuditApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.1-preview'

    # AuditApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    AuditApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get all auditable actions filterable by area.
    [PSObject] GetActions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "audit/actions", $this.apiVersion, $null)
    }

    # Queries audit log entries
    [PSObject] QueryLog([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "audit/auditlog", $this.apiVersion, $null)
    }

    # Downloads audit log entries.
    [PSObject] DownloadLog([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "audit/downloadlog", $this.apiVersion, $null)
    }

    # Update existing Audit Stream
    [PSObject] UpdateStream([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'put', "audit/streams", $this.apiVersion, $body)
    }
     # Create new Audit Stream
    [PSObject] CreateStream([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "audit/streams", $this.apiVersion, $body)
    }
     # Return all Audit Streams scoped to an organization
    [PSObject] QueryAllStreams([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "audit/streams", $this.apiVersion, $null)
    }

    # Update existing Audit Stream status
    [PSObject] UpdateStatus([bool] $useTargetProject, [int] $streamId) {
        return $this.Request($useTargetProject, 'put', "audit/streams/$streamId", $this.apiVersion, $null)
    }
     # Delete Audit Stream
    [PSObject] DeleteStream([bool] $useTargetProject, [int] $streamId) {
        return $this.Request($useTargetProject, 'delete', "audit/streams/$streamId", $this.apiVersion, $null)
    }
     # Return Audit Stream with id of streamId if one exists otherwise throw
    [PSObject] QueryStreamById([bool] $useTargetProject, [int] $streamId) {
        return $this.Request($useTargetProject, 'get', "audit/streams/$streamId", $this.apiVersion, $null)
    }

}


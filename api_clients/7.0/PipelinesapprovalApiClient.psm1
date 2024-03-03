# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class PipelinesapprovalApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0-preview'

    # PipelinesapprovalApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PipelinesapprovalApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # List Approvals. This can be used to get a set of pending approvals in a pipeline, on an user or for a resource..
    [PSObject] QueryApprovals([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "pipelines/approvals", $this.apiVersion, $null)
    }
     # Update approvals.
    [PSObject] UpdateApprovals([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "pipelines/approvals", $this.apiVersion, $body)
    }

    # Get an approval.
    [PSObject] GetApproval([bool] $useTargetProject, [string] $approvalId) {
        return $this.Request($useTargetProject, 'get', "pipelines/approvals/$approvalId", $this.apiVersion, $null)
    }

}


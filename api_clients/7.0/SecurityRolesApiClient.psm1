# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class SecurityRolesApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0-preview'

    # SecurityRolesApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    SecurityRolesApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Set role assignments on a resource
    [PSObject] SetRoleAssignments([bool] $useTargetProject, [PSObject] $body, [string] $scopeId, [string] $resourceId) {
        return $this.Request($useTargetProject, 'put', "securityroles/scopes/$scopeId/roleassignments/resources/$resourceId", $this.apiVersion, $body)
    }
     # empty
    [PSObject] RemoveRoleAssignments([bool] $useTargetProject, [PSObject] $body, [string] $scopeId, [string] $resourceId) {
        return $this.Request($useTargetProject, 'patch', "securityroles/scopes/$scopeId/roleassignments/resources/$resourceId", $this.apiVersion, $body)
    }
     # Get role assignments for the resource
    [PSObject] GetRoleAssignments([bool] $useTargetProject, [string] $scopeId, [string] $resourceId) {
        return $this.Request($useTargetProject, 'get', "securityroles/scopes/$scopeId/roleassignments/resources/$resourceId", $this.apiVersion, $null)
    }

    # Remove the role assignment on a resource
    [PSObject] RemoveRoleAssignment([bool] $useTargetProject, [string] $scopeId, [string] $resourceId, [string] $identityId) {
        return $this.Request($useTargetProject, 'delete', "securityroles/scopes/$scopeId/roleassignments/resources/$resourceId/$identityId", $this.apiVersion, $null)
    }
     # Set role assignment on a resource
    [PSObject] SetRoleAssignment([bool] $useTargetProject, [PSObject] $body, [string] $scopeId, [string] $resourceId, [string] $identityId) {
        return $this.Request($useTargetProject, 'put', "securityroles/scopes/$scopeId/roleassignments/resources/$resourceId/$identityId", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetRoleDefinitions([bool] $useTargetProject, [string] $scopeId) {
        return $this.Request($useTargetProject, 'get', "securityroles/scopes/$scopeId/roledefinitions", $this.apiVersion, $null)
    }

}


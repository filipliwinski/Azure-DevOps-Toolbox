# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class SecurityApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '4.1'

    # SecurityApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    SecurityApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Remove the specified ACEs from the ACL belonging to the specified token.
    [PSObject] RemoveAccessControlEntries([bool] $useTargetProject, [string] $securityNamespaceId) {
        return $this.Request($useTargetProject, 'delete', "accesscontrolentries/$securityNamespaceId", $this.apiVersion, $null)
    }
     # Add or update ACEs in the ACL for the provided token. In the case of a collision (by identity descriptor) with an existing ACE in the ACL, the "merge" parameter determines the behavior. If set, the existing ACE has its allow and deny merged with the incoming ACE's allow and deny. If unset, the existing ACE is displaced.
    [PSObject] SetAccessControlEntries([bool] $useTargetProject, [PSObject] $body, [string] $securityNamespaceId) {
        return $this.Request($useTargetProject, 'post', "accesscontrolentries/$securityNamespaceId", $this.apiVersion, $body)
    }

    # Create one or more access control lists.
    [PSObject] SetAccessControlLists([bool] $useTargetProject, [PSObject] $body, [string] $securityNamespaceId) {
        return $this.Request($useTargetProject, 'post', "accesscontrollists/$securityNamespaceId", $this.apiVersion, $body)
    }
     # Return a list of access control lists for the specified security namespace and token.
    [PSObject] QueryAccessControlLists([bool] $useTargetProject, [string] $securityNamespaceId) {
        return $this.Request($useTargetProject, 'get', "accesscontrollists/$securityNamespaceId", $this.apiVersion, $null)
    }
     # Remove access control lists under the specfied security namespace.
    [PSObject] RemoveAccessControlLists([bool] $useTargetProject, [string] $securityNamespaceId) {
        return $this.Request($useTargetProject, 'delete', "accesscontrollists/$securityNamespaceId", $this.apiVersion, $null)
    }

    # Evaluates whether the caller has the specified permissions on the specified set of security tokens.
    [PSObject] HasPermissions([bool] $useTargetProject, [string] $securityNamespaceId, [int] $permissions) {
        return $this.Request($useTargetProject, 'get', "permissions/$securityNamespaceId/$permissions", $this.apiVersion, $null)
    }
     # Removes the specified permissions from the caller or specified user or group.
    [PSObject] RemovePermission([bool] $useTargetProject, [string] $securityNamespaceId, [int] $permissions) {
        return $this.Request($useTargetProject, 'delete', "permissions/$securityNamespaceId/$permissions", $this.apiVersion, $null)
    }

    # Evaluates multiple permissions for the calling user.  Note: This method does not aggregate the results, nor does it short-circuit if one of the permissions evaluates to false.
    [PSObject] HasPermissionsBatch([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "security/permissionevaluationbatch", $this.apiVersion, $body)
    }

    # empty
    [PSObject] QuerySecurityNamespaces([bool] $useTargetProject, [string] $securityNamespaceId) {
        return $this.Request($useTargetProject, 'get', "securitynamespaces/$securityNamespaceId", $this.apiVersion, $null)
    }

}


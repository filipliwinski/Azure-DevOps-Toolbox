# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class MemberEntitlementManagementApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1'

    # MemberEntitlementManagementApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    MemberEntitlementManagementApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Create a group entitlement with license rule, extension rule.
    [PSObject] AddGroupEntitlement([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "groupentitlements", $this.apiVersion, $body)
    }
     # Get the group entitlements for an account.
    [PSObject] GetGroupEntitlements([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "groupentitlements", $this.apiVersion, $null)
    }

    # Update entitlements (License Rule, Extensions Rule, Project memberships etc.) for a group.
    [PSObject] UpdateGroupEntitlement([bool] $useTargetProject, [PSObject] $body, [string] $groupId) {
        return $this.Request($useTargetProject, 'patch', "groupentitlements/$groupId", $this.apiVersion, $body)
    }
     # Get a group entitlement.If the group entitlement does not exist, returns null.
    [PSObject] GetGroupEntitlement([bool] $useTargetProject, [string] $groupId) {
        return $this.Request($useTargetProject, 'get', "groupentitlements/$groupId", $this.apiVersion, $null)
    }
     # Delete a group entitlement.
    [PSObject] DeleteGroupEntitlement([bool] $useTargetProject, [string] $groupId) {
        return $this.Request($useTargetProject, 'delete', "groupentitlements/$groupId", $this.apiVersion, $null)
    }

    # Get direct members of a Group.
    [PSObject] GetGroupMembers([bool] $useTargetProject, [string] $groupId) {
        return $this.Request($useTargetProject, 'get', "GroupEntitlements/$groupId/members", $this.apiVersion, $null)
    }

    # Add a member to a Group.
    [PSObject] AddMemberToGroup([bool] $useTargetProject, [string] $groupId, [string] $memberId) {
        return $this.Request($useTargetProject, 'put', "GroupEntitlements/$groupId/members/$memberId", $this.apiVersion, $null)
    }
     # Remove a member from a Group.
    [PSObject] RemoveMemberFromGroup([bool] $useTargetProject, [string] $groupId, [string] $memberId) {
        return $this.Request($useTargetProject, 'delete', "GroupEntitlements/$groupId/members/$memberId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] SearchMemberEntitlements([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "memberentitlements", $this.apiVersion, $null)
    }

    # Add a service principal, assign license and extensions and make them a member of a project group in an account.NOTE: If you are working with AAD app registration, you can find service principal of your appin enterprise applications, and make sure to use service principal's object id as originId parameterin the request body
    [PSObject] AddServicePrincipalEntitlement([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "serviceprincipalentitlements", $this.apiVersion, $body)
    }
     # Edit the entitlements (License, Extensions, Projects, Teams etc) for one or more service principals.
    [PSObject] UpdateServicePrincipalEntitlements([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "serviceprincipalentitlements", $this.apiVersion, $body)
    }

    # Edit the entitlements (License, Extensions, Projects, Teams etc) for a service principal.
    [PSObject] UpdateServicePrincipalEntitlement([bool] $useTargetProject, [PSObject] $body, [string] $servicePrincipalId) {
        return $this.Request($useTargetProject, 'patch', "serviceprincipalentitlements/$servicePrincipalId", $this.apiVersion, $body)
    }
     # Get Service principal Entitlement for a service principal.
    [PSObject] GetServicePrincipalEntitlement([bool] $useTargetProject, [string] $servicePrincipalId) {
        return $this.Request($useTargetProject, 'get', "serviceprincipalentitlements/$servicePrincipalId", $this.apiVersion, $null)
    }
     # Delete a service principal from the account.The delete operation includes unassigning Extensions and Licenses and removing the service principal from all project memberships.The service principal would continue to have access to the account if it is member of an AAD group, that is added directly to the account.
    [PSObject] DeleteServicePrincipalEntitlement([bool] $useTargetProject, [string] $servicePrincipalId) {
        return $this.Request($useTargetProject, 'delete', "serviceprincipalentitlements/$servicePrincipalId", $this.apiVersion, $null)
    }

    # Edit the entitlements (License, Extensions, Projects, Teams etc) for one or more users.
    [PSObject] UpdateUserEntitlements([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "userentitlements", $this.apiVersion, $body)
    }
     # Get a paged set of user entitlements matching the filter and sort criteria built with properties that match the select input.
    [PSObject] SearchUserEntitlements([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "userentitlements", $this.apiVersion, $null)
    }
     # Add a user, assign license and extensions and make them a member of a project group in an account.
    [PSObject] AddUserEntitlement([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "userentitlements", $this.apiVersion, $body)
    }

    # Edit the entitlements (License, Extensions, Projects, Teams etc) for a user.
    [PSObject] UpdateUserEntitlement([bool] $useTargetProject, [PSObject] $body, [string] $userId) {
        return $this.Request($useTargetProject, 'patch', "userentitlements/$userId", $this.apiVersion, $body)
    }
     # Get User Entitlement for a user.
    [PSObject] GetUserEntitlement([bool] $useTargetProject, [string] $userId) {
        return $this.Request($useTargetProject, 'get', "userentitlements/$userId", $this.apiVersion, $null)
    }
     # Delete a user from the account.The delete operation includes unassigning Extensions and Licenses and removing the user from all project memberships.The user would continue to have access to the account if she is member of an AAD group, that is added directly to the account.
    [PSObject] DeleteUserEntitlement([bool] $useTargetProject, [string] $userId) {
        return $this.Request($useTargetProject, 'delete', "userentitlements/$userId", $this.apiVersion, $null)
    }

    # Get summary of Licenses, Extension, Projects, Groups and their assignments in the collection.
    [PSObject] GetUsersSummary([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "userentitlementsummary", $this.apiVersion, $null)
    }

}


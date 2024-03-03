# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class GraphApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0-preview'

    # GraphApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    GraphApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Resolve a storage key to a descriptor
    [PSObject] GetDescriptor([bool] $useTargetProject, [string] $storageKey) {
        return $this.Request($useTargetProject, 'get', "graph/descriptors/$storageKey", $this.apiVersion, $null)
    }

    # Create a new Azure DevOps group or materialize an existing AAD group.The body of the request must be a derived type of GraphGroupCreationContext:  * GraphGroupVstsCreationContext - Create a new Azure DevOps group that is not backed by an external provider.  * GraphGroupMailAddressCreationContext - Create a new group using the mail address as a reference to an existing group from an external AD or AAD backed provider.  * GraphGroupOriginIdCreationContext - Create a new group using the OriginID as a reference to a group from an external AD or AAD backed provider. Optionally, you can add the newly created group as a member of an existing Azure DevOps group and/or specify a custom storage key for the group.
    [PSObject] CreateGroup([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "graph/groups", $this.apiVersion, $body)
    }
     # Gets a list of all groups in the current scope (usually organization or account).The optional parameters are used to filter down the returned results. Returned results are in no guaranteed order. Since the list of groups may be large, results are returned in pages of groups.  If there are more results than can be returned in a single page, the result set will contain a continuation token for retrieval of the next set of results.
    [PSObject] ListGroups([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "graph/groups", $this.apiVersion, $null)
    }

    # Get a group by its descriptor.The group will be returned even if it has been deleted from the account or has had all its membershipsdeleted.
    [PSObject] GetGroup([bool] $useTargetProject, [string] $groupDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/groups/$groupDescriptor", $this.apiVersion, $null)
    }
     # Update the properties of an Azure DevOps group.Currently limited to only changing the description and account name.
    [PSObject] UpdateGroup([bool] $useTargetProject, [string] $groupDescriptor, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "graph/groups/$groupDescriptor", $this.apiVersion, $body)
    }
     # Removes an Azure DevOps group from all of its parent groups.The group will still be visible, but membership checks for the group, and all descendants which derive membership through it, will return false.”
    [PSObject] DeleteGroup([bool] $useTargetProject, [string] $groupDescriptor) {
        return $this.Request($useTargetProject, 'delete', "graph/groups/$groupDescriptor", $this.apiVersion, $null)
    }

    # Get all the memberships where this descriptor is a member in the relationship.The default value for direction is 'up' meaning return all memberships where the subject is a member (e.g. all groups the subject is a member of). Alternatively, passing the direction as 'down' will return all memberships where the subject is a container (e.g. all members of the subject group).
    [PSObject] ListMemberships([bool] $useTargetProject, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/Memberships/$subjectDescriptor", $this.apiVersion, $null)
    }

    # Check to see if a membership relationship between a container and subject exists.
    [PSObject] CheckMembershipExistence_Head([bool] $useTargetProject, [string] $subjectDescriptor, [string] $containerDescriptor) {
        return $this.Request($useTargetProject, 'head', "graph/memberships/$subjectDescriptor/$containerDescriptor", $this.apiVersion, $null)
    }
     # Deletes a membership between a container and subject.
    [PSObject] RemoveMembership([bool] $useTargetProject, [string] $subjectDescriptor, [string] $containerDescriptor) {
        return $this.Request($useTargetProject, 'delete', "graph/memberships/$subjectDescriptor/$containerDescriptor", $this.apiVersion, $null)
    }
     # Get a membership relationship between a container and subject.
    [PSObject] GetMembership([bool] $useTargetProject, [string] $subjectDescriptor, [string] $containerDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/memberships/$subjectDescriptor/$containerDescriptor", $this.apiVersion, $null)
    }
     # Create a new membership between a container and subject.
    [PSObject] AddMembership([bool] $useTargetProject, [string] $subjectDescriptor, [string] $containerDescriptor) {
        return $this.Request($useTargetProject, 'put', "graph/memberships/$subjectDescriptor/$containerDescriptor", $this.apiVersion, $null)
    }

    # Check whether a subject is active or inactive.
    [PSObject] GetMembershipState([bool] $useTargetProject, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/membershipstates/$subjectDescriptor", $this.apiVersion, $null)
    }

    # empty
    [PSObject] RequestAccess([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "graph/requestaccess", $this.apiVersion, $body)
    }

    # Resolve a descriptor to a storage key.
    [PSObject] GetStorageKey([bool] $useTargetProject, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/storagekeys/$subjectDescriptor", $this.apiVersion, $null)
    }

    # Resolve descriptors to users, groups or scopes (Subjects) in a batch.
    [PSObject] LookupSubjects([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "graph/subjectlookup", $this.apiVersion, $body)
    }

    # Search for Azure Devops users, or/and groups. Results will be returned in a batch with no more than 100 graph subjects.
    [PSObject] QuerySubjects([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "graph/subjectquery", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetAvatar([bool] $useTargetProject, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/Subjects/$subjectDescriptor/avatars", $this.apiVersion, $null)
    }
     # empty
    [PSObject] SetAvatar([bool] $useTargetProject, [PSObject] $body, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'put', "graph/Subjects/$subjectDescriptor/avatars", $this.apiVersion, $body)
    }
     # empty
    [PSObject] DeleteAvatar([bool] $useTargetProject, [string] $subjectDescriptor) {
        return $this.Request($useTargetProject, 'delete', "graph/Subjects/$subjectDescriptor/avatars", $this.apiVersion, $null)
    }

    # Materialize an existing AAD or MSA user into the VSTS account.NOTE: Created users are not active in an account unless they have been explicitly assigned a parent group at creation time or have signed in  and been autolicensed through AAD group memberships. Adding a user to an account is required before the user can be added to VSTS groups or assigned an asset. The body of the request must be a derived type of GraphUserCreationContext:  * GraphUserMailAddressCreationContext - Create a new user using the mail address as a reference to an existing user from an external AD or AAD backed provider.  * GraphUserOriginIdCreationContext - Create a new user using the OriginID as a reference to an existing user from an external AD or AAD backed provider.  * GraphUserPrincipalNameCreationContext - Create a new user using the principal name as a reference to an existing user from an external AD or AAD backed provider. If the user to be added corresponds to a user that was previously deleted, then that user will be restored. Optionally, you can add the newly created user as a member of an existing VSTS group and/or specify a custom storage key for the user.
    [PSObject] CreateUser([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "graph/users", $this.apiVersion, $body)
    }
     # Get a list of all users in a given scope.Since the list of users may be large, results are returned in pages of users.  If there are more results than can be returned in a single page, the result set will contain a continuation token for retrieval of the next set of results.
    [PSObject] ListUsers([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "graph/users", $this.apiVersion, $null)
    }

    # Get a user by its descriptor.
    [PSObject] GetUser([bool] $useTargetProject, [string] $userDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/users/$userDescriptor", $this.apiVersion, $null)
    }
     # Map an existing user to a different identity
    [PSObject] UpdateUser([bool] $useTargetProject, [PSObject] $body, [string] $userDescriptor) {
        return $this.Request($useTargetProject, 'patch', "graph/users/$userDescriptor", $this.apiVersion, $body)
    }
     # Disables a user.The user will still be visible, but membership checks for the user will return false.”
    [PSObject] DeleteUser([bool] $useTargetProject, [string] $userDescriptor) {
        return $this.Request($useTargetProject, 'delete', "graph/users/$userDescriptor", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetProviderInfo([bool] $useTargetProject, [string] $userDescriptor) {
        return $this.Request($useTargetProject, 'get', "graph/Users/$userDescriptor/providerinfo", $this.apiVersion, $null)
    }

}


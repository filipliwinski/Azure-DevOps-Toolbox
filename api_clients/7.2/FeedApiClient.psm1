# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class FeedApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # FeedApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    FeedApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Set service-wide permissions that govern feed creation and administration.
    [PSObject] SetGlobalPermissions([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "packaging/globalpermissions", $this.apiVersion, $body)
    }
     # Get all service-wide feed creation and administration permissions.
    [PSObject] GetGlobalPermissions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/globalpermissions", $this.apiVersion, $null)
    }

    # Query to determine which feeds have changed since the last call, tracked through the provided continuationToken. Only changes to a feed itself are returned and impact the continuationToken, not additions or alterations to packages within the feeds.If the project parameter is present, gets all feed changes in the given project.If omitted, gets all feed changes in the organization.
    [PSObject] GetFeedChanges([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/feedchanges", $this.apiVersion, $null)
    }

    # Query a feed to determine its current state.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetFeedChange([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/feedchanges/$feedId", $this.apiVersion, $null)
    }

    # Query for feeds within the recycle bin.If the project parameter is present, gets all feeds in recycle bin in the given project.If omitted, gets all feeds in recycle bin in the organization.
    [PSObject] GetFeedsFromRecycleBin([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/feedrecyclebin", $this.apiVersion, $null)
    }

    # Restores a deleted feed and all of its packages.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] RestoreDeletedFeed([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'patch', "packaging/feedrecyclebin/$feedId", $this.apiVersion, $body)
    }
     # Permanently delete a feed and all of its packages. The action is irreversible and the package content will be deleted immediately.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] PermanentDeleteFeed([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'delete', "packaging/feedrecyclebin/$feedId", $this.apiVersion, $null)
    }

    # Get all feeds in an account where you have the provided role access.If the project parameter is present, gets all feeds in the given project.If omitted, gets all feeds in the organization.
    [PSObject] GetFeeds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds", $this.apiVersion, $null)
    }
     # Create a feed, a container for various package types.Feeds can be created in a project if the project parameter is included in the request url.If the project parameter is omitted, the feed will not be associated with a project and will be created at the organization level.
    [PSObject] CreateFeed([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds", $this.apiVersion, $body)
    }

    # Get the settings for a specific feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetFeed([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId", $this.apiVersion, $null)
    }
     # Remove a feed and all its packages. The feed moves to the recycle bin and is reversible.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeleteFeed([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId", $this.apiVersion, $null)
    }
     # Change the attributes of a feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdateFeed([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId", $this.apiVersion, $body)
    }

    # Get a batch of package changes made to a feed.  The changes returned are 'most recent change' so if an Add is followed by an Update before you begin enumerating, you'll only see one change in the batch.  While consuming batches using the continuation token, you may see changes to the same package version multiple times if they are happening as you enumerate.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageChanges([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/packagechanges", $this.apiVersion, $null)
    }

    # empty
    [PSObject] QueryPackageMetrics([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/Feeds/$feedId/packagemetricsbatch", $this.apiVersion, $body)
    }

    # Get details about all of the packages in the feed. Use the various filters to include or exclude information from the result set.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackages([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/packages", $this.apiVersion, $null)
    }

    # Get details about a specific package.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackage([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/packages/$packageId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] QueryPackageVersionMetrics([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'post', "packaging/Feeds/$feedId/Packages/$packageId/versionmetricsbatch", $this.apiVersion, $body)
    }

    # Get a list of package versions, optionally filtering by state.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersions([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/Packages/$packageId/versions", $this.apiVersion, $null)
    }

    # Get details about a specific package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageId, [string] $packageVersionId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/Packages/$packageId/versions/$packageVersionId", $this.apiVersion, $null)
    }

    # Gets provenance for a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersionProvenance([bool] $useTargetProject, [string] $feedId, [string] $packageId, [string] $packageVersionId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/Packages/$packageId/Versions/$packageVersionId/provenance", $this.apiVersion, $null)
    }

    # Update the permissions on a feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] SetFeedPermissions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'patch', "packaging/Feeds/$feedId/permissions", $this.apiVersion, $body)
    }
     # Get the permissions for a feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetFeedPermissions([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/permissions", $this.apiVersion, $null)
    }

    # Query for packages within the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetRecycleBinPackages([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages", $this.apiVersion, $null)
    }
     # Queues a job to remove all package versions from a feed's recycle bin
    [PSObject] EmptyRecycleBin([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'delete', "packaging/Feeds/$feedId/RecycleBin/Packages", $this.apiVersion, $null)
    }

    # Get information about a package and all its versions within the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetRecycleBinPackage([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages/$packageId", $this.apiVersion, $null)
    }

    # Get a list of package versions within the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetRecycleBinPackageVersions([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages/$packageId/Versions", $this.apiVersion, $null)
    }

    # Get information about a package version within the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetRecycleBinPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageId, [string] $packageVersionId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages/$packageId/Versions/$packageVersionId", $this.apiVersion, $null)
    }

    # Get the retention policy for a feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetFeedRetentionPolicies([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/retentionpolicies", $this.apiVersion, $null)
    }
     # Delete the retention policy for a feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeleteFeedRetentionPolicies([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'delete', "packaging/Feeds/$feedId/retentionpolicies", $this.apiVersion, $null)
    }
     # Set the retention policy for a feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] SetFeedRetentionPolicies([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'put', "packaging/Feeds/$feedId/retentionpolicies", $this.apiVersion, $body)
    }

    # Get all views for a feed.The project parameter must be supplied if the feed was created in a project.
    [PSObject] GetFeedViews([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/views", $this.apiVersion, $null)
    }
     # Create a new view on the referenced feed.The project parameter must be supplied if the feed was created in a project.
    [PSObject] CreateFeedView([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/Feeds/$feedId/views", $this.apiVersion, $body)
    }

    # Get a view by Id.The project parameter must be supplied if the feed was created in a project.
    [PSObject] GetFeedView([bool] $useTargetProject, [string] $feedId, [string] $viewId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/views/$viewId", $this.apiVersion, $null)
    }
     # Delete a feed view.The project parameter must be supplied if the feed was created in a project.
    [PSObject] DeleteFeedView([bool] $useTargetProject, [string] $feedId, [string] $viewId) {
        return $this.Request($useTargetProject, 'delete', "packaging/Feeds/$feedId/views/$viewId", $this.apiVersion, $null)
    }
     # Update a view.The project parameter must be supplied if the feed was created in a project.
    [PSObject] UpdateFeedView([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $viewId) {
        return $this.Request($useTargetProject, 'patch', "packaging/Feeds/$feedId/views/$viewId", $this.apiVersion, $body)
    }

    # Generate a SVG badge for the latest version of a package.  The generated SVG is typically used as the image in an HTML link which takes users to the feed containing the package to accelerate discovery and consumption.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetBadge([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "public/packaging/Feeds/$feedId/Packages/$packageId/badge", $this.apiVersion, $null)
    }

}


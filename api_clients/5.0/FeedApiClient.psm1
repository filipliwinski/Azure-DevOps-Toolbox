# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class FeedApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0-preview'

    # FeedApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    FeedApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Query to determine which feeds have changed since the last call, tracked through the provided continuationToken. Only changes to a feed itself are returned and impact the continuationToken, not additions or alterations to packages within the feeds.
    [PSObject] GetFeedChanges([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/feedchanges", $this.apiVersion, $null)
    }

    # Query a feed to determine its current state.
    [PSObject] GetFeedChange([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/feedchanges/$feedId", $this.apiVersion, $null)
    }

    # Create a feed, a container for various package types.
    [PSObject] CreateFeed([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds", $this.apiVersion, $body)
    }
     # Get all feeds in an account where you have the provided role access.
    [PSObject] GetFeeds([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds", $this.apiVersion, $null)
    }

    # Change the attributes of a feed.
    [PSObject] UpdateFeed([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId", $this.apiVersion, $body)
    }
     # Remove a feed and all its packages.  The action does not result in packages moving to the RecycleBin and is not reversible.
    [PSObject] DeleteFeed([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId", $this.apiVersion, $null)
    }
     # Get the settings for a specific feed.
    [PSObject] GetFeed([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId", $this.apiVersion, $null)
    }

    # Get a batch of package changes made to a feed.  The changes returned are 'most recent change' so if an Add is followed by an Update before you begin enumerating, you'll only see one change in the batch.  While consuming batches using the continuation token, you may see changes to the same package version multiple times if they are happening as you enumerate.
    [PSObject] GetPackageChanges([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/packagechanges", $this.apiVersion, $null)
    }

    # Get details about all of the packages in the feed.  Use the various filters to include or exclude information from the result set.
    [PSObject] GetPackages([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/packages", $this.apiVersion, $null)
    }

    # Get details about a specific package.
    [PSObject] GetPackage([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/packages/$packageId", $this.apiVersion, $null)
    }

    # Get a list of package versions, optionally filtering by state.
    [PSObject] GetPackageVersions([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/Packages/$packageId/versions", $this.apiVersion, $null)
    }

    # Get details about a specific package version.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageId, [string] $packageVersionId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/Packages/$packageId/versions/$packageVersionId", $this.apiVersion, $null)
    }

    # Gets provenance for a package version.
    [PSObject] GetPackageVersionProvenance([bool] $useTargetProject, [string] $feedId, [string] $packageId, [string] $packageVersionId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/Packages/$packageId/Versions/$packageVersionId/provenance", $this.apiVersion, $null)
    }

    # Get the permissions for a feed.
    [PSObject] GetFeedPermissions([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/permissions", $this.apiVersion, $null)
    }
     # Update the permissions on a feed.
    [PSObject] SetFeedPermissions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'patch', "packaging/Feeds/$feedId/permissions", $this.apiVersion, $body)
    }

    # Query for packages within the recycle bin.
    [PSObject] GetRecycleBinPackages([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages", $this.apiVersion, $null)
    }

    # Get information about a package and all its versions within the recycle bin.
    [PSObject] GetRecycleBinPackage([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages/$packageId", $this.apiVersion, $null)
    }

    # Get a list of package versions within the recycle bin.
    [PSObject] GetRecycleBinPackageVersions([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages/$packageId/Versions", $this.apiVersion, $null)
    }

    # Get information about a package version within the recycle bin.
    [PSObject] GetRecycleBinPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageId, [string] $packageVersionId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/RecycleBin/Packages/$packageId/Versions/$packageVersionId", $this.apiVersion, $null)
    }

    # Set the retention policy for a feed.
    [PSObject] SetFeedRetentionPolicies([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'put', "packaging/Feeds/$feedId/retentionpolicies", $this.apiVersion, $body)
    }
     # Delete the retention policy for a feed.
    [PSObject] DeleteFeedRetentionPolicies([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'delete', "packaging/Feeds/$feedId/retentionpolicies", $this.apiVersion, $null)
    }
     # Get the retention policy for a feed.
    [PSObject] GetFeedRetentionPolicies([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/retentionpolicies", $this.apiVersion, $null)
    }

    # Create a new view on the referenced feed.
    [PSObject] CreateFeedView([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/Feeds/$feedId/views", $this.apiVersion, $body)
    }
     # Get all views for a feed.
    [PSObject] GetFeedViews([bool] $useTargetProject, [string] $feedId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/views", $this.apiVersion, $null)
    }

    # Update a view.
    [PSObject] UpdateFeedView([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $viewId) {
        return $this.Request($useTargetProject, 'patch', "packaging/Feeds/$feedId/views/$viewId", $this.apiVersion, $body)
    }
     # Delete a feed view.
    [PSObject] DeleteFeedView([bool] $useTargetProject, [string] $feedId, [string] $viewId) {
        return $this.Request($useTargetProject, 'delete', "packaging/Feeds/$feedId/views/$viewId", $this.apiVersion, $null)
    }
     # Get a view by Id.
    [PSObject] GetFeedView([bool] $useTargetProject, [string] $feedId, [string] $viewId) {
        return $this.Request($useTargetProject, 'get', "packaging/Feeds/$feedId/views/$viewId", $this.apiVersion, $null)
    }

    # Get all service-wide feed creation permissions.
    [PSObject] GetGlobalPermissions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "packaging/globalpermissions", $this.apiVersion, $null)
    }
     # Set service-wide permissions that govern feed creation.
    [PSObject] SetGlobalPermissions([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "packaging/globalpermissions", $this.apiVersion, $body)
    }

    # Generate a SVG badge for the latest version of a package.  The generated SVG is typically used as the image in an HTML link which takes users to the feed containing the package to accelerate discovery and consumption.
    [PSObject] GetBadge([bool] $useTargetProject, [string] $feedId, [string] $packageId) {
        return $this.Request($useTargetProject, 'get', "public/packaging/Feeds/$feedId/Packages/$packageId/badge", $this.apiVersion, $null)
    }

}


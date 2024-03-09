# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class NpmOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0'

    # NpmOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    NpmOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Unpublish a scoped package version (such as @scope/name).The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UnpublishScopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Get information about a scoped package version (such as @scope/name).The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetScopedPackageInfoAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateScopedPackageAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $body)
    }

    # Unpublish an unscoped package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UnpublishPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Get information about an unscoped package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageInfoAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdatePackageAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }

    # Set the upstreaming behavior of a (scoped) package within the context of a feedThe package does not need to necessarily exist in the feed prior to setting the behavior.This assists with packages that are not yet ingested from an upstream, yet the feed owner wantsto apply a specific behavior on the first ingestion.
    [PSObject] SetScopedUpstreamingBehavior([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/packages/@$packageScope/$unscopedPackageName/upstreaming", $this.apiVersion, $body)
    }
     # Get the upstreaming behavior of the (scoped) package within the context of a feed
    [PSObject] GetScopedUpstreamingBehavior([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/@$packageScope/$unscopedPackageName/upstreaming", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetContentScopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion/content", $this.apiVersion, $null)
    }

    # Get the Readme for a package version with an npm scope.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetReadmeScopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion/readme", $this.apiVersion, $null)
    }

    # Set the upstreaming behavior of a (scoped) package within the context of a feedThe package does not need to necessarily exist in the feed prior to setting the behavior.This assists with packages that are not yet ingested from an upstream, yet the feed owner wantsto apply a specific behavior on the first ingestion.
    [PSObject] SetUpstreamingBehavior([bool] $useTargetProject, [string] $feedId, [string] $packageName, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/packages/$packageName/upstreaming", $this.apiVersion, $body)
    }
     # Get the upstreaming behavior of the (unscoped) package within the context of a feed
    [PSObject] GetUpstreamingBehavior([bool] $useTargetProject, [string] $feedId, [string] $packageName) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/$packageName/upstreaming", $this.apiVersion, $null)
    }

    # Get an unscoped npm package.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetContentUnscopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/$packageName/versions/$packageVersion/content", $this.apiVersion, $null)
    }

    # Get the Readme for a package version that has no npm scope.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetReadmeUnscopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/$packageName/versions/$packageVersion/readme", $this.apiVersion, $null)
    }

    # Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackagesAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/npm/packagesbatch", $this.apiVersion, $body)
    }

    # Get information about a scoped package version in the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetScopedPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/RecycleBin/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Delete a package version with an npm scope from the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeleteScopedPackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/RecycleBin/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Restore a package version with an npm scope from the recycle bin to its feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] RestoreScopedPackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/RecycleBin/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $body)
    }

    # Get information about an unscoped package version in the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Delete a package version without an npm scope from the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Restore a package version without an npm scope from the recycle bin to its feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }

    # Delete or restore several package versions from the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdateRecycleBinPackagesAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/npm/RecycleBin/PackagesBatch", $this.apiVersion, $body)
    }

}


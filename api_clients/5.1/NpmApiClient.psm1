# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class NpmApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1-preview'

    # NpmApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    NpmApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Unpublish a scoped package version (such as @scope/name).
    [PSObject] UnpublishScopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateScopedPackageAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Get information about a scoped package version (such as @scope/name).
    [PSObject] GetScopedPackageInfoAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # Unpublish an unscoped package version.
    [PSObject] UnpublishPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdatePackageAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Get information about an unscoped package version.
    [PSObject] GetPackageInfoAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetContentScopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion/content", $this.apiVersion, $null)
    }

    # Get the Readme for a package version with an npm scope.
    [PSObject] GetReadmeScopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion/readme", $this.apiVersion, $null)
    }

    # Get an unscoped npm package.
    [PSObject] GetContentUnscopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/$packageName/versions/$packageVersion/content", $this.apiVersion, $null)
    }

    # Get the Readme for a package version that has no npm scope.
    [PSObject] GetReadmeUnscopedPackageAsync([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/packages/$packageName/versions/$packageVersion/readme", $this.apiVersion, $null)
    }

    # Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.
    [PSObject] UpdatePackagesAsync([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/npm/packagesbatch", $this.apiVersion, $body)
    }

    # Get information about a scoped package version in the recycle bin.
    [PSObject] GetScopedPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/RecycleBin/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Restore a package version with an npm scope from the recycle bin to its feed.
    [PSObject] RestoreScopedPackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/RecycleBin/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Delete a package version with an npm scope from the recycle bin.
    [PSObject] DeleteScopedPackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageScope, [string] $unscopedPackageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/RecycleBin/packages/@$packageScope/$unscopedPackageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # Get information about an unscoped package version in the recycle bin.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/npm/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Restore a package version without an npm scope from the recycle bin to its feed.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/npm/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Delete a package version without an npm scope from the recycle bin.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/npm/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

}


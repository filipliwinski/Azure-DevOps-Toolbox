# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class NuGetOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0-preview'

    # NuGetOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    NuGetOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get information about a package version.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Send a package version from the feed to its paired recycle bin.
    [PSObject] DeletePackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Set mutable state on a package version.
    [PSObject] UpdatePackageVersion([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }

    # Download a package version directly.  This API is intended for manual UI download options, not for programmatic access and scripting.  You may be heavily throttled if accessing this api for scripting purposes.
    [PSObject] DownloadPackage([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion/content", $this.apiVersion, $null)
    }

    # Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.
    [PSObject] UpdatePackageVersions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/nuget/packagesbatch", $this.apiVersion, $body)
    }

    # View a package version's deletion/recycled status
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/nuget/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Delete a package version from a feed's recycle bin.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/nuget/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Restore a package version from a feed's recycle bin back into the active feed.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/nuget/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }

}


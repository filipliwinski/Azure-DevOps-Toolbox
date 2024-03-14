# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class PyPiApiApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0-preview'

    # PyPiApiApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PyPiApiApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Update state for a package version.
    [PSObject] UpdatePackageVersion([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/pypi/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Delete a package version, moving it to the recycle bin.
    [PSObject] DeletePackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/pypi/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Get information about a package version.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/pypi/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # Download a python package file directly. This API is intended for manual UI download options, not for programmatic access and scripting.
    [PSObject] DownloadPackage([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion, [string] $fileName) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/pypi/packages/$packageName/versions/$packageVersion/$fileName/content", $this.apiVersion, $null)
    }

    # Restore a package version from the recycle bin to its associated feed.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/pypi/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Delete a package version from the feed, moving it to the recycle bin.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/pypi/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Get information about a package version in the recycle bin.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/pypi/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

}


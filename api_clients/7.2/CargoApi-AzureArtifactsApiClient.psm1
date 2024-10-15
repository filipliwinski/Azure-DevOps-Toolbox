# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class CargoApi-AzureArtifactsApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # CargoApi-AzureArtifactsApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    CargoApi-AzureArtifactsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get the upstreaming behavior of a package within the context of a feed
    [PSObject] GetUpstreamingBehavior([bool] $useTargetProject, [string] $feed, [string] $packageName) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/cargo/packages/$packageName/upstreaming", $this.apiVersion, $null)
    }
     # Set the upstreaming behavior of a package within the context of a feedThe package does not need to necessarily exist in the feed prior to setting the behavior.This assists with packages that are not yet ingested from an upstream, yet the feed owner wantsto apply a specific behavior on the first ingestion.
    [PSObject] SetUpstreamingBehavior([bool] $useTargetProject, [string] $feed, [string] $packageName, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feed/cargo/packages/$packageName/upstreaming", $this.apiVersion, $body)
    }

    # Update state for a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackageVersion([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/cargo/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Get information about a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/cargo/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Send a package version from the feed to its paired recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeletePackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/cargo/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # Restore a package version from the recycle bin to its associated feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/cargo/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Get information about a package version in the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/cargo/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Delete a package version from the feed, moving it to the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/cargo/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # Delete or restore several package versions from the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdateRecycleBinPackageVersions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/cargo/RecycleBin/packagesBatch", $this.apiVersion, $body)
    }

    # Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackageVersions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "_packaging/packaging/feeds/$feedId/cargo/packagesbatch", $this.apiVersion, $body)
    }

}


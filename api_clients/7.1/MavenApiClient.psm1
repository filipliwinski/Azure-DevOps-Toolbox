# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class MavenApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

    # MavenApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    MavenApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get the upstreaming behavior of a package within the context of a feed
    [PSObject] GetUpstreamingBehavior([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/upstreaming", $this.apiVersion, $null)
    }
     # Set the upstreaming behavior of a package within the context of a feedThe package does not need to necessarily exist in the feed prior to setting the behavior.This assists with packages that are not yet ingested from an upstream, yet the feed owner wantsto apply a specific behavior on the first ingestion.
    [PSObject] SetUpstreamingBehavior([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/upstreaming", $this.apiVersion, $body)
    }

    # Delete a package version from the feed and move it to the feed's recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] PackageDelete([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }
     # Update state for a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackageVersion([bool] $useTargetProject, [PSObject] $body, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $body)
    }
     # Get information about a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }

    # Get information about a package version in the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/maven/RecycleBin/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }
     # Restore a package version from the recycle bin to its associated feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feed/maven/RecycleBin/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $body)
    }
     # Permanently delete a package from a feed's recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feed/maven/RecycleBin/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }

    # Delete or restore several package versions from the recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdateRecycleBinPackagesAsync([bool] $useTargetProject, [PSObject] $body, [string] $feed) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feed/maven/RecycleBin/packagesBatch", $this.apiVersion, $body)
    }

    # Fulfills Maven package file download requests by either returning the URL of the requested package file or, in the case of Azure DevOps Server (OnPrem), returning the content as a stream.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DownloadPackage([bool] $useTargetProject, [string] $feedId, [string] $groupId, [string] $artifactId, [string] $version, [string] $fileName) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/maven/$groupId/$artifactId/$version/$fileName/content", $this.apiVersion, $null)
    }

    # Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackageVersions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/maven/packagesbatch", $this.apiVersion, $body)
    }

}


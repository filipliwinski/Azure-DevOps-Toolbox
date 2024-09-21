# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class MavenApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0-preview'

    # MavenApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    MavenApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Delete a package version from the feed and move it to the feed's recycle bin.
    [PSObject] PackageDelete([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }
     # Get information about a package version.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }

    # Get information about a package version in the recycle bin.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/maven/RecycleBin/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }
     # Permanently delete a package from a feed's recycle bin.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feed/maven/RecycleBin/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }
     # Restore a package version from the recycle bin to its associated feed.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feed/maven/RecycleBin/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $body)
    }

}


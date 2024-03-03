# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class MavenApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1-preview'

    # MavenApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    MavenApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get information about a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
    }
     # Delete a package version from the feed and move it to the feed's recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] PackageDelete([bool] $useTargetProject, [string] $feed, [string] $groupId, [string] $artifactId, [string] $version) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feed/maven/groups/$groupId/artifacts/$artifactId/versions/$version", $this.apiVersion, $null)
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

    # Fulfills Maven package file download requests by either returning the URL of the requested package file or, in the case of Azure DevOps Server (OnPrem), returning the content as a stream.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DownloadPackage([bool] $useTargetProject, [string] $feedId, [string] $groupId, [string] $artifactId, [string] $version, [string] $fileName) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/maven/$groupId/$artifactId/$version/$fileName/content", $this.apiVersion, $null)
    }

}


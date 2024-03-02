# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class NuGetOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0-preview'

    # NuGetOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    NuGetOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Set mutable state on a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackageVersion([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Send a package version from the feed to its paired recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeletePackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # Get information about a package version.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersion([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

    # Download a package version directly.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DownloadPackage([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/nuget/packages/$packageName/versions/$packageVersion/content", $this.apiVersion, $null)
    }

    # Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] UpdatePackageVersions([bool] $useTargetProject, [PSObject] $body, [string] $feedId) {
        return $this.Request($useTargetProject, 'post', "packaging/feeds/$feedId/nuget/packagesbatch", $this.apiVersion, $body)
    }

    # Restore a package version from a feed's recycle bin back into the active feed.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] RestorePackageVersionFromRecycleBin([bool] $useTargetProject, [PSObject] $body, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'patch', "packaging/feeds/$feedId/nuget/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $body)
    }
     # Delete a package version from a feed's recycle bin.The project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] DeletePackageVersionFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'delete', "packaging/feeds/$feedId/nuget/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }
     # View a package version's deletion/recycled statusThe project parameter must be supplied if the feed was created in a project.If the feed is not associated with any project, omit the project parameter from the request.
    [PSObject] GetPackageVersionMetadataFromRecycleBin([bool] $useTargetProject, [string] $feedId, [string] $packageName, [string] $packageVersion) {
        return $this.Request($useTargetProject, 'get', "packaging/feeds/$feedId/nuget/RecycleBin/packages/$packageName/versions/$packageVersion", $this.apiVersion, $null)
    }

}


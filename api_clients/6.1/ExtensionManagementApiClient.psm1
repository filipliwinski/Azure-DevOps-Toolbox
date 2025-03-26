# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class ExtensionManagementApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.1-preview'

    # ExtensionManagementApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ExtensionManagementApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Update an installed extension. Typically this API is used to enable or disable an extension.
    [PSObject] UpdateInstalledExtension([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "extensionmanagement/installedextensions", $this.apiVersion, $body)
    }
     # List the installed extensions in the account / project collection.
    [PSObject] GetInstalledExtensions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "extensionmanagement/installedextensions", $this.apiVersion, $null)
    }

    # Uninstall the specified extension from the account / project collection.
    [PSObject] UninstallExtensionByName([bool] $useTargetProject, [string] $publisherName, [string] $extensionName) {
        return $this.Request($useTargetProject, 'delete', "extensionmanagement/installedextensionsbyname/$publisherName/$extensionName", $this.apiVersion, $null)
    }
     # Get an installed extension by its publisher and extension name.
    [PSObject] GetInstalledExtensionByName([bool] $useTargetProject, [string] $publisherName, [string] $extensionName) {
        return $this.Request($useTargetProject, 'get', "extensionmanagement/installedextensionsbyname/$publisherName/$extensionName", $this.apiVersion, $null)
    }

    # Install the specified extension into the account / project collection.
    [PSObject] InstallExtensionByName([bool] $useTargetProject, [string] $publisherName, [string] $extensionName, [string] $version) {
        return $this.Request($useTargetProject, 'post', "extensionmanagement/installedextensionsbyname/$publisherName/$extensionName/$version", $this.apiVersion, $null)
    }

}


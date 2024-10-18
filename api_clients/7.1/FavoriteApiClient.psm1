# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class FavoriteApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

    # FavoriteApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    FavoriteApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # empty
    [PSObject] CreateFavorite([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "favorite/favorites", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetFavorites([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "favorite/favorites", $this.apiVersion, $null)
    }

    # empty
    [PSObject] DeleteFavoriteById([bool] $useTargetProject, [string] $favoriteId) {
        return $this.Request($useTargetProject, 'delete', "favorite/favorites/$favoriteId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] GetFavoriteById([bool] $useTargetProject, [string] $favoriteId) {
        return $this.Request($useTargetProject, 'get', "favorite/favorites/$favoriteId", $this.apiVersion, $null)
    }

}


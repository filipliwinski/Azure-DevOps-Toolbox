# This file was auto-generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class SearchApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1-preview'

    # SearchApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    SearchApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Provides a set of results for the search text.
    [PSObject] FetchPackageSearchResults([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "search/packagesearchresults", $this.apiVersion, $body)
    }

    # Provides a set of results for the search text.
    [PSObject] FetchCodeSearchResults([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "search/codesearchresults", $this.apiVersion, $body)
    }

    # Provides a set of results for the search request.
    [PSObject] FetchWikiSearchResults([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "search/wikisearchresults", $this.apiVersion, $body)
    }

    # Provides a set of results for the search text.
    [PSObject] FetchWorkItemSearchResults([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "search/workitemsearchresults", $this.apiVersion, $body)
    }

}


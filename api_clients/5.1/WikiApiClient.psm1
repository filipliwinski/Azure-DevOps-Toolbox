# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class WikiApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1'

    # WikiApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WikiApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Gets all wikis in a project or collection.
    [PSObject] GetAllWikis([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "wiki/wikis", $this.apiVersion, $null)
    }
     # Creates the wiki resource.
    [PSObject] CreateWiki([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "wiki/wikis", $this.apiVersion, $body)
    }

    # Deletes the wiki corresponding to the wiki name or Id provided.
    [PSObject] DeleteWiki([bool] $useTargetProject, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'delete', "wiki/wikis/$wikiIdentifier", $this.apiVersion, $null)
    }
     # Gets the wiki corresponding to the wiki name or Id provided.
    [PSObject] GetWiki([bool] $useTargetProject, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'get', "wiki/wikis/$wikiIdentifier", $this.apiVersion, $null)
    }
     # Updates the wiki corresponding to the wiki Id or name provided using the update parameters.
    [PSObject] UpdateWiki([bool] $useTargetProject, [PSObject] $body, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'patch', "wiki/wikis/$wikiIdentifier", $this.apiVersion, $body)
    }

    # Creates an attachment in the wiki.
    [PSObject] CreateAttachment([bool] $useTargetProject, [PSObject] $body, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'put', "wiki/wikis/$wikiIdentifier/attachments", $this.apiVersion, $body)
    }

    # Creates a page move operation that updates the path and order of the page as provided in the parameters.
    [PSObject] CreatePageMove([bool] $useTargetProject, [PSObject] $body, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'post', "wiki/wikis/$wikiIdentifier/pagemoves", $this.apiVersion, $body)
    }

    # Creates or edits a wiki page.
    [PSObject] CreateOrUpdatePage([bool] $useTargetProject, [PSObject] $body, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'put', "wiki/wikis/$wikiIdentifier/pages", $this.apiVersion, $body)
    }
     # Deletes a wiki page.
    [PSObject] DeletePage([bool] $useTargetProject, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'delete', "wiki/wikis/$wikiIdentifier/pages", $this.apiVersion, $null)
    }
     # Gets metadata or content of the wiki page for the provided path. Content negotiation is done based on the `Accept` header sent in the request.
    [PSObject] GetPage([bool] $useTargetProject, [string] $wikiIdentifier) {
        return $this.Request($useTargetProject, 'get', "wiki/wikis/$wikiIdentifier/pages", $this.apiVersion, $null)
    }

    # Deletes a wiki page.
    [PSObject] DeletePageById([bool] $useTargetProject, [string] $wikiIdentifier, [int] $id) {
        return $this.Request($useTargetProject, 'delete', "wiki/wikis/$wikiIdentifier/pages/$id", $this.apiVersion, $null)
    }
     # Gets metadata or content of the wiki page for the provided page id. Content negotiation is done based on the `Accept` header sent in the request.
    [PSObject] GetPageById([bool] $useTargetProject, [string] $wikiIdentifier, [int] $id) {
        return $this.Request($useTargetProject, 'get', "wiki/wikis/$wikiIdentifier/pages/$id", $this.apiVersion, $null)
    }
     # Edits a wiki page.
    [PSObject] UpdatePageById([bool] $useTargetProject, [PSObject] $body, [string] $wikiIdentifier, [int] $id) {
        return $this.Request($useTargetProject, 'patch', "wiki/wikis/$wikiIdentifier/pages/$id", $this.apiVersion, $body)
    }

}


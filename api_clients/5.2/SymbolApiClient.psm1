# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class SymbolApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.2-preview'

    # SymbolApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    SymbolApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Check the availability of symbol service. This includes checking for feature flag, and possibly license in future. Note this is NOT an anonymous endpoint, and the caller will be redirected to authentication before hitting it.
    [PSObject] CheckAvailabilityAsync([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "symbol/availability", $this.apiVersion, $null)
    }

    # Get client version information.
    [PSObject] HeadClient_Head([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'head', "symbol/client", $this.apiVersion, $null)
    }

    # Get the client package.
    [PSObject] GetClient([bool] $useTargetProject, [string] $clientType) {
        return $this.Request($useTargetProject, 'get', "symbol/client/$clientType", $this.apiVersion, $null)
    }

    # Get a symbol request by request name.
    [PSObject] GetRequestsRequestNameAsync([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "symbol/requests", $this.apiVersion, $null)
    }
     # Create a new symbol request.
    [PSObject] CreateRequestsAsync([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "symbol/requests", $this.apiVersion, $body)
    }
     # Delete a symbol request by request name.
    [PSObject] DeleteRequestsRequestNameAsync([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "symbol/requests", $this.apiVersion, $null)
    }
     # Update a symbol request by request name.
    [PSObject] UpdateRequestsRequestNameAsync([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "symbol/requests", $this.apiVersion, $body)
    }

    # Get a symbol request by request identifier.
    [PSObject] GetRequestsRequestIdAsync([bool] $useTargetProject, [string] $requestId) {
        return $this.Request($useTargetProject, 'get', "symbol/requests/$requestId", $this.apiVersion, $null)
    }
     # Create debug entries for a symbol request as specified by its identifier.
    [PSObject] CreateRequestsRequestIdDebugEntriesAsync([bool] $useTargetProject, [PSObject] $body, [string] $requestId) {
        return $this.Request($useTargetProject, 'post', "symbol/requests/$requestId", $this.apiVersion, $body)
    }
     # Delete a symbol request by request identifier.
    [PSObject] DeleteRequestsRequestIdAsync([bool] $useTargetProject, [string] $requestId) {
        return $this.Request($useTargetProject, 'delete', "symbol/requests/$requestId", $this.apiVersion, $null)
    }
     # Update a symbol request by request identifier.
    [PSObject] UpdateRequestsRequestIdAsync([bool] $useTargetProject, [PSObject] $body, [string] $requestId) {
        return $this.Request($useTargetProject, 'patch', "symbol/requests/$requestId", $this.apiVersion, $body)
    }

    # Given a client key, returns the best matched debug entry.
    [PSObject] GetSymSrvDebugEntryClientKeyAsync([bool] $useTargetProject, [string] $debugEntryClientKey) {
        return $this.Request($useTargetProject, 'get', "symbol/symsrv/$debugEntryClientKey", $this.apiVersion, $null)
    }

}


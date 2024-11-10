# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class ServiceEndpointApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # ServiceEndpointApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ServiceEndpointApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Creates a new service endpoint
    [PSObject] CreateServiceEndpoint([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "serviceendpoint/endpoints", $this.apiVersion, $body)
    }
     # Update the service endpoints.
    [PSObject] UpdateServiceEndpoints([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'put', "serviceendpoint/endpoints", $this.apiVersion, $body)
    }

    # Update the service endpoint
    [PSObject] UpdateServiceEndpoint([bool] $useTargetProject, [PSObject] $body, [string] $endpointId) {
        return $this.Request($useTargetProject, 'put', "serviceendpoint/endpoints/$endpointId", $this.apiVersion, $body)
    }
     # Share service endpoint across projects
    [PSObject] ShareServiceEndpoint([bool] $useTargetProject, [PSObject] $body, [string] $endpointId) {
        return $this.Request($useTargetProject, 'patch', "serviceendpoint/endpoints/$endpointId", $this.apiVersion, $body)
    }
     # Delete a service endpoint
    [PSObject] DeleteServiceEndpoint([bool] $useTargetProject, [string] $endpointId) {
        return $this.Request($useTargetProject, 'delete', "serviceendpoint/endpoints/$endpointId", $this.apiVersion, $null)
    }

    # Get service endpoint types.
    [PSObject] GetServiceEndpointTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "serviceendpoint/types", $this.apiVersion, $null)
    }

    # Get service endpoint execution records.
    [PSObject] GetServiceEndpointExecutionRecords([bool] $useTargetProject, [string] $endpointId) {
        return $this.Request($useTargetProject, 'get', "serviceendpoint/$endpointId/executionhistory", $this.apiVersion, $null)
    }

    # Use ExecuteServiceEndpointRequest API Instead
    [PSObject] QueryServiceEndpoint([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "serviceendpoint/endpointproxy", $this.apiVersion, $body)
    }

    # Get the service endpoints by name.
    [PSObject] GetServiceEndpointsByNames([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "serviceendpoint/endpoints", $this.apiVersion, $null)
    }
     # Gets the service endpoints and patch new authorization parameters
    [PSObject] GetServiceEndpointsWithRefreshedAuthentication([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "serviceendpoint/endpoints", $this.apiVersion, $body)
    }

    # Get the service endpoint details.
    [PSObject] GetServiceEndpointDetails([bool] $useTargetProject, [string] $endpointId) {
        return $this.Request($useTargetProject, 'get', "serviceendpoint/endpoints/$endpointId", $this.apiVersion, $null)
    }

}


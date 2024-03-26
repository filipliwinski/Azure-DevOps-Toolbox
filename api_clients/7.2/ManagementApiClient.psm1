# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class ManagementApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # ManagementApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ManagementApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Update the status of Advanced Security for the organization
    [PSObject] UpdateOrgEnablementStatus([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "management/enablement", $this.apiVersion, $body)
    }
     # Get the current status of Advanced Security for the organization
    [PSObject] GetOrgEnablementStatus([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/enablement", $this.apiVersion, $null)
    }

    # Get commiters used when calculating billing information.
    [PSObject] GetMeterUsage([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/meterusage/default", $this.apiVersion, $null)
    }

    # Estimate the committers that would be added to the customer's usage if Advanced Security was enabled for this organization.
    [PSObject] GetEstimatedOrgBillablePushers([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/meterUsageEstimate", $this.apiVersion, $null)
    }

    # Update the status of Advanced Security for the project
    [PSObject] UpdateProjectEnablementStatus([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "management/enablement", $this.apiVersion, $body)
    }
     # Get the current status of Advanced Security for a project
    [PSObject] GetProjectEnablementStatus([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/enablement", $this.apiVersion, $null)
    }

    # Estimate the number of committers that would be added to the customer's usage if Advanced Security was enabled for this project.
    [PSObject] GetEstimatedProjectBillablePushers([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/meterUsageEstimate", $this.apiVersion, $null)
    }

    # Update the enablement of Advanced Security for a repository
    [PSObject] UpdateRepoAdvSecEnablementStatus([bool] $useTargetProject, [PSObject] $body, [string] $repository) {
        return $this.Request($useTargetProject, 'patch', "management/repositories/$repository/enablement", $this.apiVersion, $body)
    }
     # Determine if Advanced Security is enabled for a repository
    [PSObject] GetRepoEnablementStatus([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "management/repositories/$repository/enablement", $this.apiVersion, $null)
    }

    # Estimate the committers that would be added to the customer's usage if Advanced Security was enabled for this repository.
    [PSObject] GetEstimatedRepoBillableCommitters([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "management/repositories/$repository/meterUsageEstimate", $this.apiVersion, $null)
    }

}


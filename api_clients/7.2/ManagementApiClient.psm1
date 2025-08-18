# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class ManagementApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.2-preview'

    # ManagementApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ManagementApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get the current status of Advanced Security for the organization
    [PSObject] GetOrgEnablementStatus3([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/enablement", $this.apiVersion, $null)
    }
     # Update the status of Advanced Security for the organization
    [PSObject] UpdateOrgEnablementStatus3([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "management/enablement", $this.apiVersion, $body)
    }

    # Get commiters used when calculating billing information.
    [PSObject] GetMeterUsage3([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/meterusage/default", $this.apiVersion, $null)
    }

    # Estimate the pushers that would be added to the customer's usage if Advanced Security was enabled for this organization.
    [PSObject] GetEstimatedBillablePushersDetailsForOrg3([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/meterUsageEstimate/default", $this.apiVersion, $null)
    }

    # Get the current status of Advanced Security for a project
    [PSObject] GetProjectEnablementStatus3([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/enablement", $this.apiVersion, $null)
    }
     # Update the status of Advanced Security for the project
    [PSObject] UpdateProjectEnablementStatus3([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "management/enablement", $this.apiVersion, $body)
    }

    # Estimate the pushers that would be added to the customer's usage if Advanced Security was enabled for this project.
    [PSObject] GetEstimatedBillablePushersDetailsForProject3([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "management/meterUsageEstimate/default", $this.apiVersion, $null)
    }

    # Determines if Code Security, Secret Protection, and their features are enabled for the repository.
    [PSObject] GetRepoEnablementStatus3([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "management/repositories/$repository/enablement", $this.apiVersion, $null)
    }
     # Update the enablement status of Code Security and Secret Protection, along with their respective features, for a given repository.
    [PSObject] UpdateRepoAdvSecEnablementStatus3([bool] $useTargetProject, [PSObject] $body, [string] $repository) {
        return $this.Request($useTargetProject, 'patch', "management/repositories/$repository/enablement", $this.apiVersion, $body)
    }

    # Estimate the pushers that would be added to the customer's usage if Advanced Security was enabled for this repository.
    [PSObject] GetEstimatedBillableCommittersDetailsForRepo3([bool] $useTargetProject, [string] $repository) {
        return $this.Request($useTargetProject, 'get', "management/repositories/$repository/meterUsageEstimate/default", $this.apiVersion, $null)
    }

}


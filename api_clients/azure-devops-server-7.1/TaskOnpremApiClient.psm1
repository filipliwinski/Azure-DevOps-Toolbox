# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TaskOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1'

    # TaskOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TaskOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Send a pipeline job event to be processed by the execution plan.
    [PSObject] PostEvent([bool] $useTargetProject, [PSObject] $body, [string] $scopeIdentifier, [string] $hubName, [string] $planId) {
        return $this.Request($useTargetProject, 'post', "$scopeIdentifier/distributedtask/hubs/$hubName/plans/$planId/events", $this.apiVersion, $body)
    }

    # empty
    [PSObject] CreateOidcToken([bool] $useTargetProject, [PSObject] $body, [string] $scopeIdentifier, [string] $hubName, [string] $planId, [string] $jobId) {
        return $this.Request($useTargetProject, 'post', "$scopeIdentifier/distributedtask/hubs/$hubName/plans/$planId/jobs/$jobId/oidctoken", $this.apiVersion, $body)
    }

    # Create a log and connect it to a pipeline run's execution plan.
    [PSObject] CreateLog([bool] $useTargetProject, [PSObject] $body, [string] $scopeIdentifier, [string] $hubName, [string] $planId) {
        return $this.Request($useTargetProject, 'post', "$scopeIdentifier/distributedtask/hubs/$hubName/plans/$planId/logs", $this.apiVersion, $body)
    }

    # Append a log to a task's log. The log should be sent in the body of the request as a TaskLog object stream.
    [PSObject] AppendLogContent([bool] $useTargetProject, [PSObject] $body, [string] $scopeIdentifier, [string] $hubName, [string] $planId, [int] $logId) {
        return $this.Request($useTargetProject, 'post', "$scopeIdentifier/distributedtask/hubs/$hubName/plans/$planId/logs/$logId", $this.apiVersion, $body)
    }

    # Update timeline records if they already exist, otherwise create new ones for the same timeline.
    [PSObject] UpdateRecords([bool] $useTargetProject, [PSObject] $body, [string] $scopeIdentifier, [string] $hubName, [string] $planId, [string] $timelineId) {
        return $this.Request($useTargetProject, 'patch', "$scopeIdentifier/distributedtask/hubs/$hubName/plans/$planId/timelines/$timelineId/records", $this.apiVersion, $body)
    }

}


# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class TestResultsApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.1-preview'

    # TestResultsApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TestResultsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get list of test Result meta data details for corresponding testcasereferenceId
    [PSObject] QueryTestResultsMetaData([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/results/resultmetadata", $this.apiVersion, $body)
    }

    # Update properties of test result meta data
    [PSObject] UpdateTestResultsMetaData([bool] $useTargetProject, [PSObject] $body, [int] $testCaseReferenceId) {
        return $this.Request($useTargetProject, 'patch', "testresults/results/resultmetadata/$testCaseReferenceId", $this.apiVersion, $body)
    }

    # Get list of test result attachments reference
    [PSObject] GetTestResultLogsAsync([bool] $useTargetProject, [int] $runId, [int] $resultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$resultId/testlog", $this.apiVersion, $null)
    }

    # Create empty file for a result and Get Sas uri for the file
    [PSObject] TestLogStoreEndpointDetailsForResult([bool] $useTargetProject, [int] $runId, [int] $resultId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/results/$resultId/testlogstoreendpoint", $this.apiVersion, $null)
    }
     # Get SAS Uri of a test results attachment
    [PSObject] GetTestLogStoreEndpointDetailsForResultLog([bool] $useTargetProject, [int] $runId, [int] $resultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$resultId/testlogstoreendpoint", $this.apiVersion, $null)
    }

    # Get list of test run attachments reference
    [PSObject] GetTestRunLogsAsync([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/testlog", $this.apiVersion, $null)
    }

    # Create empty file for a run and Get Sas uri for the file
    [PSObject] TestLogStoreEndpointDetailsForRun([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/testlogstoreendpoint", $this.apiVersion, $null)
    }
     # Get SAS Uri of a test run attachment
    [PSObject] GetTestLogStoreEndpointDetailsForRunLog([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/testlogstoreendpoint", $this.apiVersion, $null)
    }

}


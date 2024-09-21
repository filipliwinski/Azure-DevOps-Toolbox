# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TestResultsApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1'

    # TestResultsApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TestResultsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # http://(tfsserver):8080/tfs/DefaultCollection/_apis/test/CodeCoverage?buildId=10 Request: Json of code coverage summary
    [PSObject] UpdateCodeCoverageSummary([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/codecoverage", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetCodeCoverageSummary([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/codecoverage", $this.apiVersion, $null)
    }

    # Get file coverage for the specified file
    [PSObject] GetFileLevelCodeCoverage([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/codecoverage/filecoverage", $this.apiVersion, $body)
    }

    # <p>Gets the coverage status for the last successful build of a definition, optionally scoped to a specific branch</p>
    [PSObject] GetCoverageStatusBadge([bool] $useTargetProject, [string] $definition) {
        return $this.Request($useTargetProject, 'get', "testresults/codecoverage/status/$definition", $this.apiVersion, $null)
    }

    # Get summary of test results.
    [PSObject] GetTestPipelineMetrics([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/metrics", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultDetailsForBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultdetailsbybuild", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultDetailsForRelease([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultdetailsbyrelease", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetResultGroupsByBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultgroupsbybuild", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetResultGroupsByRelease([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultgroupsbyrelease", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultsByQuery([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/results", $this.apiVersion, $body)
    }

    # empty
    [PSObject] QueryTestResultHistory([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/results/history", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetTestResultsByQueryWiql([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/results/query", $this.apiVersion, $body)
    }

    # Get list of test Result meta data details for corresponding testcasereferenceId
    [PSObject] QueryTestResultsMetaData([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/results/resultmetadata", $this.apiVersion, $body)
    }

    # Update properties of test result meta data
    [PSObject] UpdateTestResultsMetaData([bool] $useTargetProject, [PSObject] $body, [int] $testCaseReferenceId) {
        return $this.Request($useTargetProject, 'patch', "testresults/results/resultmetadata/$testCaseReferenceId", $this.apiVersion, $body)
    }

    # Get history of a test method using TestHistoryQuery
    [PSObject] QueryTestHistory([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/results/testhistory", $this.apiVersion, $body)
    }

    # Query Test Result WorkItems based on filter
    [PSObject] QueryTestResultWorkItems([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/results/workitems", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultsByBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsbybuild", $this.apiVersion, $null)
    }

    # Get a list of results.
    [PSObject] GetTestResultsByPipeline([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsbypipeline", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultsByRelease([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsbyrelease", $this.apiVersion, $null)
    }

    # Get all the available groups details and for these groups get failed and aborted results.
    [PSObject] TestResultsGroupDetails([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsgroupdetails", $this.apiVersion, $null)
    }

    # empty
    [PSObject] QueryTestResultsReportForBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsummarybybuild", $this.apiVersion, $null)
    }

    # Get summary of test results.
    [PSObject] QueryTestResultsReportForPipeline([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsummarybypipeline", $this.apiVersion, $null)
    }

    # empty
    [PSObject] QueryTestResultsSummaryForReleases([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/resultsummarybyrelease", $this.apiVersion, $body)
    }
     # empty
    [PSObject] QueryTestResultsReportForRelease([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/resultsummarybyrelease", $this.apiVersion, $null)
    }

    # empty
    [PSObject] QueryTestSummaryByRequirement([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/resultsummarybyrequirement", $this.apiVersion, $body)
    }

    # empty
    [PSObject] QueryResultTrendForBuild([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/resulttrendbybuild", $this.apiVersion, $body)
    }

    # empty
    [PSObject] QueryResultTrendForRelease([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/resulttrendbyrelease", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetTestRuns([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/runs", $this.apiVersion, $null)
    }
     # empty
    [PSObject] CreateTestRun([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/runs", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetTestRunById([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] DeleteTestRun([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'delete', "testresults/runs/$runId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateTestRun([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'patch', "testresults/runs/$runId", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetTestRunAttachments([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/attachments", $this.apiVersion, $null)
    }
     # empty
    [PSObject] CreateTestRunAttachment([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/attachments", $this.apiVersion, $body)
    }

    # Returns a test run attachment
    [PSObject] GetTestRunAttachment([bool] $useTargetProject, [int] $runId, [int] $attachmentId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/attachments/$attachmentId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] DeleteTestRunAttachment([bool] $useTargetProject, [int] $runId, [int] $attachmentId) {
        return $this.Request($useTargetProject, 'delete', "testresults/runs/$runId/attachments/$attachmentId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestRunCodeCoverage([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/codecoverage", $this.apiVersion, $null)
    }

    # Get test run message logs
    [PSObject] GetTestRunMessageLogs([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/messagelogs", $this.apiVersion, $null)
    }

    # empty
    [PSObject] PublishTestResultDocument([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/resultdocument", $this.apiVersion, $body)
    }

    # empty
    [PSObject] GetTestResults([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results", $this.apiVersion, $null)
    }
     # empty
    [PSObject] AddTestResultsToTestRun([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/results", $this.apiVersion, $body)
    }
     # empty
    [PSObject] UpdateTestResults([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'patch', "testresults/runs/$runId/results", $this.apiVersion, $body)
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

    # empty
    [PSObject] GetTestResultAttachments([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$testCaseResultId/attachments", $this.apiVersion, $null)
    }
     # empty
    [PSObject] CreateTestResultAttachment([bool] $useTargetProject, [PSObject] $body, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/results/$testCaseResultId/attachments", $this.apiVersion, $body)
    }

    # Returns a test result attachment
    [PSObject] GetTestResultAttachment([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId, [int] $attachmentId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$testCaseResultId/attachments/$attachmentId", $this.apiVersion, $null)
    }
     # empty
    [PSObject] DeleteTestResultAttachment([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId, [int] $attachmentId) {
        return $this.Request($useTargetProject, 'delete', "testresults/runs/$runId/results/$testCaseResultId/attachments/$attachmentId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetBugsLinkedToTestResult([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$testCaseResultId/bugs", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultWorkItemsById([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$testCaseResultId/workitems", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestResultById([bool] $useTargetProject, [int] $runId, [int] $testResultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$testResultId", $this.apiVersion, $null)
    }

    # Gets the list of results whose failure matches with the provided one.
    [PSObject] GetSimilarTestResults([bool] $useTargetProject, [int] $runId, [int] $testResultId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/results/$testResultId/similartestresults", $this.apiVersion, $null)
    }

    # Get test run summary, used when we want to get summary of a run by outcome. Test run should be in completed state.
    [PSObject] GetTestRunSummaryByOutcome([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/runsummary", $this.apiVersion, $null)
    }

    # Get test run statistics , used when we want to get summary of a run by outcome.
    [PSObject] GetTestRunStatistics([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/statistics", $this.apiVersion, $null)
    }

    # empty
    [PSObject] UpdateTestRunTags([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'patch', "testresults/runs/$runId/tags", $this.apiVersion, $body)
    }

    # Deletes the attachment with the specified filename for the specified runId from the LogStore.
    [PSObject] DeleteTestRunLogStoreAttachment([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'delete', "testresults/runs/$runId/testattachments", $this.apiVersion, $null)
    }
     # Creates an attachment in the LogStore for the specified runId.
    [PSObject] CreateTestRunLogStoreAttachment([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "testresults/runs/$runId/testattachments", $this.apiVersion, $body)
    }
     # Returns a list of attachments for the specified runId from the LogStore.
    [PSObject] GetTestRunLogStoreAttachments([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "testresults/runs/$runId/testattachments", $this.apiVersion, $null)
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

    # Update project settings of test results
    [PSObject] UpdatePipelinesTestSettings([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "testresults/settings", $this.apiVersion, $body)
    }
     # Get TestResultsSettings data
    [PSObject] GetTestResultsSettings([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/settings", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestTagsForBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/tags", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetTestTagSummaryForBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/tagsummary", $this.apiVersion, $null)
    }

    # Returns the list of test failure types.
    [PSObject] GetFailureTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/testfailuretype", $this.apiVersion, $null)
    }
     # Creates a new test failure type
    [PSObject] CreateFailureType([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/testfailuretype", $this.apiVersion, $body)
    }

    # Deletes a test failure type with specified failureTypeId
    [PSObject] DeleteFailureType([bool] $useTargetProject, [int] $failureTypeId) {
        return $this.Request($useTargetProject, 'delete', "testresults/testfailuretype/$failureTypeId", $this.apiVersion, $null)
    }

    # Get list of build attachments reference
    [PSObject] GetTestLogsForBuildAsync([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/testlog", $this.apiVersion, $null)
    }

    # Create and Get sas uri of the build container
    [PSObject] TestLogStoreEndpointDetailsForBuild([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'post', "testresults/testlogstoreendpoint", $this.apiVersion, $null)
    }
     # Get SAS Uri of a build attachment
    [PSObject] GetTestLogStoreEndpointDetailsForBuildLog([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/testlogstoreendpoint", $this.apiVersion, $null)
    }

    # empty
    [PSObject] DeleteTestMethodToWorkItemLink([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "testresults/testmethods/workitems", $this.apiVersion, $null)
    }
     # empty
    [PSObject] AddWorkItemToTestLinks([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/testmethods/workitems", $this.apiVersion, $body)
    }

    # empty
    [PSObject] DeleteTestSettings([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "testresults/testsettings", $this.apiVersion, $null)
    }
     # empty
    [PSObject] CreateTestSettings([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testresults/testsettings", $this.apiVersion, $body)
    }
     # empty
    [PSObject] GetTestSettingsById([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testresults/testsettings", $this.apiVersion, $null)
    }

    # Creates an attachment in the LogStore for the specified buildId.
    [PSObject] CreateBuildAttachmentInLogStore([bool] $useTargetProject, [PSObject] $body, [int] $buildId) {
        return $this.Request($useTargetProject, 'post', "testresults/uploadbuildattachments/$buildId", $this.apiVersion, $body)
    }

}


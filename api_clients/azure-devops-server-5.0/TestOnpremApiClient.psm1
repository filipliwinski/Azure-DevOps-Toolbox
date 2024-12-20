# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TestOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0'

    # TestOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TestOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Find the list of all test suites in which a given test case is present. This is helpful if you need to find out which test suites are using a test case, when you need to make changes to a test case.
    [PSObject] GetSuitesByTestCaseId([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/suites", $this.apiVersion, $null)
    }

    # Get clone information.
    [PSObject] GetCloneInformation([bool] $useTargetProject, [int] $cloneOperationId) {
        return $this.Request($useTargetProject, 'get', "test/cloneoperation/$cloneOperationId", $this.apiVersion, $null)
    }

    # Get code coverage data for a build.
    [PSObject] GetBuildCodeCoverage([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/codecoverage", $this.apiVersion, $null)
    }

    # Create a test configuration
    [PSObject] CreateTestConfiguration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "test/configurations", $this.apiVersion, $body)
    }
     # Get a list of test configurations
    [PSObject] GetTestConfigurations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/configurations", $this.apiVersion, $null)
    }

    # Update a test configuration
    [PSObject] UpdateTestConfiguration([bool] $useTargetProject, [PSObject] $body, [int] $testConfigurationId) {
        return $this.Request($useTargetProject, 'patch', "test/configurations/$testConfigurationId", $this.apiVersion, $body)
    }
     # Get a test configuration
    [PSObject] GetTestConfigurationById([bool] $useTargetProject, [int] $testConfigurationId) {
        return $this.Request($useTargetProject, 'get', "test/configurations/$testConfigurationId", $this.apiVersion, $null)
    }
     # Delete a test configuration
    [PSObject] DeleteTestConfiguration([bool] $useTargetProject, [int] $testConfigurationId) {
        return $this.Request($useTargetProject, 'delete', "test/configurations/$testConfigurationId", $this.apiVersion, $null)
    }

    # Create a test plan.
    [PSObject] CreateTestPlan([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "test/plans", $this.apiVersion, $body)
    }
     # Get a list of test plans.
    [PSObject] GetPlans([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/plans", $this.apiVersion, $null)
    }

    # Update a test plan.
    [PSObject] UpdateTestPlan([bool] $useTargetProject, [PSObject] $body, [int] $planId) {
        return $this.Request($useTargetProject, 'patch', "test/plans/$planId", $this.apiVersion, $body)
    }
     # Get test plan by ID.
    [PSObject] GetPlanById([bool] $useTargetProject, [int] $planId) {
        return $this.Request($useTargetProject, 'get', "test/plans/$planId", $this.apiVersion, $null)
    }
     # Delete a test plan.
    [PSObject] DeleteTestPlan([bool] $useTargetProject, [int] $planId) {
        return $this.Request($useTargetProject, 'delete', "test/plans/$planId", $this.apiVersion, $null)
    }

    # Clone test plan
    [PSObject] CloneTestPlan([bool] $useTargetProject, [PSObject] $body, [int] $planId) {
        return $this.Request($useTargetProject, 'post', "test/Plans/$planId/cloneoperation", $this.apiVersion, $body)
    }

    # Get test suites for plan.
    [PSObject] GetTestSuitesForPlan([bool] $useTargetProject, [int] $planId) {
        return $this.Request($useTargetProject, 'get', "test/Plans/$planId/suites", $this.apiVersion, $null)
    }

    # Clone test suite
    [PSObject] CloneTestSuite([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $sourceSuiteId) {
        return $this.Request($useTargetProject, 'post', "test/Plans/$planId/Suites/$sourceSuiteId/cloneoperation", $this.apiVersion, $body)
    }

    # Get test suite by suite id.
    [PSObject] GetTestSuiteById([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "test/Plans/$planId/suites/$suiteId", $this.apiVersion, $null)
    }
     # Update a test suite.
    [PSObject] UpdateTestSuite([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'patch', "test/Plans/$planId/suites/$suiteId", $this.apiVersion, $body)
    }
     # Delete test suite.
    [PSObject] DeleteTestSuite([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'delete', "test/Plans/$planId/suites/$suiteId", $this.apiVersion, $null)
    }
     # Create a test suite.
    [PSObject] CreateTestSuite([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'post', "test/Plans/$planId/suites/$suiteId", $this.apiVersion, $body)
    }

    # Get a list of test points.
    [PSObject] GetPoints([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "test/Plans/$planId/Suites/$suiteId/points", $this.apiVersion, $null)
    }

    # Get a test point.
    [PSObject] GetPoint([bool] $useTargetProject, [int] $planId, [int] $suiteId, [int] $pointIds) {
        return $this.Request($useTargetProject, 'get', "test/Plans/$planId/Suites/$suiteId/points/$pointIds", $this.apiVersion, $null)
    }
     # Update test points.
    [PSObject] UpdateTestPoints([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId, [string] $pointIds) {
        return $this.Request($useTargetProject, 'patch', "test/Plans/$planId/Suites/$suiteId/points/$pointIds", $this.apiVersion, $body)
    }

    # Get all test cases in a suite.
    [PSObject] GetTestCases([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "test/Plans/$planId/suites/$suiteId/testcases", $this.apiVersion, $null)
    }

    # The test points associated with the test cases are removed from the test suite. The test case work item is not deleted from the system. See test cases resource to delete a test case permanently.
    [PSObject] RemoveTestCasesFromSuiteUrl([bool] $useTargetProject, [int] $planId, [int] $suiteId, [string] $testCaseIds) {
        return $this.Request($useTargetProject, 'delete', "test/Plans/$planId/suites/$suiteId/testcases/$testCaseIds", $this.apiVersion, $null)
    }
     # Updates the properties of the test case association in a suite.
    [PSObject] UpdateSuiteTestCases([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId, [string] $testCaseIds) {
        return $this.Request($useTargetProject, 'patch', "test/Plans/$planId/suites/$suiteId/testcases/$testCaseIds", $this.apiVersion, $body)
    }
     # Get a specific test case in a test suite with test case id.
    [PSObject] GetTestCaseById([bool] $useTargetProject, [int] $planId, [int] $suiteId, [int] $testCaseIds) {
        return $this.Request($useTargetProject, 'get', "test/Plans/$planId/suites/$suiteId/testcases/$testCaseIds", $this.apiVersion, $null)
    }
     # Add test cases to suite.
    [PSObject] AddTestCasesToSuite([bool] $useTargetProject, [int] $planId, [int] $suiteId, [string] $testCaseIds) {
        return $this.Request($useTargetProject, 'post', "test/Plans/$planId/suites/$suiteId/testcases/$testCaseIds", $this.apiVersion, $null)
    }

    # Get test points using query.
    [PSObject] GetPointsByQuery([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "test/points", $this.apiVersion, $body)
    }

    # Get test result retention settings
    [PSObject] GetResultRetentionSettings([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/resultretentionsettings", $this.apiVersion, $null)
    }
     # Update test result retention settings
    [PSObject] UpdateResultRetentionSettings([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "test/resultretentionsettings", $this.apiVersion, $body)
    }

    # Get history of a test method using TestHistoryQuery
    [PSObject] QueryTestHistory([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "test/Results/testhistory", $this.apiVersion, $body)
    }

    # Create new test run.
    [PSObject] CreateTestRun([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "test/runs", $this.apiVersion, $body)
    }
     # Get a list of test runs.
    [PSObject] GetTestRuns([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/runs", $this.apiVersion, $null)
    }

    # Update test run by its ID.
    [PSObject] UpdateTestRun([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'patch', "test/runs/$runId", $this.apiVersion, $body)
    }
     # Get a test run by its ID.
    [PSObject] GetTestRunById([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "test/runs/$runId", $this.apiVersion, $null)
    }
     # Delete a test run by its ID.
    [PSObject] DeleteTestRun([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'delete', "test/runs/$runId", $this.apiVersion, $null)
    }

    # Attach a file to a test run.
    [PSObject] CreateTestRunAttachment([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "test/Runs/$runId/attachments", $this.apiVersion, $body)
    }
     # Get list of test run attachments reference.
    [PSObject] GetTestRunAttachments([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/attachments", $this.apiVersion, $null)
    }

    # Download a test run attachment by its ID.
    [PSObject] GetTestRunAttachment([bool] $useTargetProject, [int] $runId, [int] $attachmentId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/attachments/$attachmentId", $this.apiVersion, $null)
    }

    # Get code coverage data for a test run
    [PSObject] GetTestRunCodeCoverage([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/codecoverage", $this.apiVersion, $null)
    }

    # Update test results in a test run.
    [PSObject] UpdateTestResults([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'patch', "test/Runs/$runId/results", $this.apiVersion, $body)
    }
     # Get test results for a test run.
    [PSObject] GetTestResults([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/results", $this.apiVersion, $null)
    }
     # Add test results to a test run.
    [PSObject] AddTestResultsToTestRun([bool] $useTargetProject, [PSObject] $body, [int] $runId) {
        return $this.Request($useTargetProject, 'post', "test/Runs/$runId/results", $this.apiVersion, $body)
    }

    # Get a test result for a test run.
    [PSObject] GetTestResultById([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/results/$testCaseResultId", $this.apiVersion, $null)
    }

    # Attach a file to a test result.
    [PSObject] CreateTestResultAttachment([bool] $useTargetProject, [PSObject] $body, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'post', "test/Runs/$runId/Results/$testCaseResultId/attachments", $this.apiVersion, $body)
    }
     # Get list of test result attachments reference.
    [PSObject] GetTestResultAttachments([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/Results/$testCaseResultId/attachments", $this.apiVersion, $null)
    }

    # Download a test result attachment by its ID.
    [PSObject] GetTestResultAttachment([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId, [int] $attachmentId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/Results/$testCaseResultId/attachments/$attachmentId", $this.apiVersion, $null)
    }

    # Get iterations for a result
    [PSObject] GetTestIterations([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/Results/$testCaseResultId/iterations", $this.apiVersion, $null)
    }

    # Get iteration for a result
    [PSObject] GetTestIteration([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/Results/$testCaseResultId/iterations/$iterationId", $this.apiVersion, $null)
    }

    # Gets the action results for an iteration in a test result.
    [PSObject] GetActionResults([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId, [int] $iterationId, [string] $actionPath) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/Results/$testCaseResultId/Iterations/$iterationId/actionresults/$actionPath", $this.apiVersion, $null)
    }

    # Get a list of parameterized results
    [PSObject] GetResultParameters([bool] $useTargetProject, [int] $runId, [int] $testCaseResultId, [int] $iterationId) {
        return $this.Request($useTargetProject, 'get', "test/Runs/$runId/Results/$testCaseResultId/Iterations/$iterationId/parameterresults", $this.apiVersion, $null)
    }

    # Get test run statistics
    [PSObject] GetTestRunStatistics([bool] $useTargetProject, [int] $runId) {
        return $this.Request($useTargetProject, 'get', "test/runs/$runId/Statistics", $this.apiVersion, $null)
    }

    # Get a list of test suite entries in the test suite.
    [PSObject] GetSuiteEntries([bool] $useTargetProject, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "test/suiteentry/$suiteId", $this.apiVersion, $null)
    }
     # Reorder test suite entries in the test suite.
    [PSObject] ReorderSuiteEntries([bool] $useTargetProject, [PSObject] $body, [int] $suiteId) {
        return $this.Request($useTargetProject, 'patch', "test/suiteentry/$suiteId", $this.apiVersion, $body)
    }

    # Delete a test case.
    [PSObject] DeleteTestCase([bool] $useTargetProject, [int] $testCaseId) {
        return $this.Request($useTargetProject, 'delete', "test/testcases/$testCaseId", $this.apiVersion, $null)
    }

    # Create a test variable.
    [PSObject] CreateTestVariable([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "test/variables", $this.apiVersion, $body)
    }
     # Get a list of test variables.
    [PSObject] GetTestVariables([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "test/variables", $this.apiVersion, $null)
    }

    # Update a test variable by its ID.
    [PSObject] UpdateTestVariable([bool] $useTargetProject, [PSObject] $body, [int] $testVariableId) {
        return $this.Request($useTargetProject, 'patch', "test/variables/$testVariableId", $this.apiVersion, $body)
    }
     # Get a test variable by its ID.
    [PSObject] GetTestVariableById([bool] $useTargetProject, [int] $testVariableId) {
        return $this.Request($useTargetProject, 'get', "test/variables/$testVariableId", $this.apiVersion, $null)
    }
     # Delete a test variable by its ID.
    [PSObject] DeleteTestVariable([bool] $useTargetProject, [int] $testVariableId) {
        return $this.Request($useTargetProject, 'delete', "test/variables/$testVariableId", $this.apiVersion, $null)
    }

    # Update a test session
    [PSObject] UpdateTestSession([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/test/session", $this.apiVersion, $body)
    }
     # Get a list of test sessions
    [PSObject] GetTestSessions([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/test/session", $this.apiVersion, $null)
    }
     # Create a test session
    [PSObject] CreateTestSession([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/test/session", $this.apiVersion, $body)
    }

}


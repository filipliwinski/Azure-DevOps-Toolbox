# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class TestPlanApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.2-preview'

    # TestPlanApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    TestPlanApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Find the list of all test suites in which a given test case is present. This is helpful if you need to find out which test suites are using a test case, when you need to make changes to a test case.
    [PSObject] GetSuitesByTestCaseId([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testplan/suites", $this.apiVersion, $null)
    }

    # Update a test configuration by its ID.
    [PSObject] UpdateTestConfiguration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "testplan/configurations", $this.apiVersion, $body)
    }
     # Create a test configuration.
    [PSObject] CreateTestConfiguration([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testplan/configurations", $this.apiVersion, $body)
    }
     # Delete a test configuration by its ID.
    [PSObject] DeleteTestConfguration([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'delete', "testplan/configurations", $this.apiVersion, $null)
    }
     # Get a list of test configurations.
    [PSObject] GetTestConfigurations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testplan/configurations", $this.apiVersion, $null)
    }

    # Get a test configuration
    [PSObject] GetTestConfigurationById([bool] $useTargetProject, [int] $testConfigurationId) {
        return $this.Request($useTargetProject, 'get', "testplan/configurations/$testConfigurationId", $this.apiVersion, $null)
    }

    # Get a list of test plans
    [PSObject] GetTestPlans([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testplan/plans", $this.apiVersion, $null)
    }
     # Create a test plan.
    [PSObject] CreateTestPlan([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testplan/plans", $this.apiVersion, $body)
    }

    # Delete a test plan.
    [PSObject] DeleteTestPlan([bool] $useTargetProject, [int] $planId) {
        return $this.Request($useTargetProject, 'delete', "testplan/plans/$planId", $this.apiVersion, $null)
    }
     # Get a test plan by Id.
    [PSObject] GetTestPlanById([bool] $useTargetProject, [int] $planId) {
        return $this.Request($useTargetProject, 'get', "testplan/plans/$planId", $this.apiVersion, $null)
    }
     # Update a test plan.
    [PSObject] UpdateTestPlan([bool] $useTargetProject, [PSObject] $body, [int] $planId) {
        return $this.Request($useTargetProject, 'patch', "testplan/plans/$planId", $this.apiVersion, $body)
    }

    # Get test suites for plan.
    [PSObject] GetTestSuitesForPlan([bool] $useTargetProject, [int] $planId) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/$planId/suites", $this.apiVersion, $null)
    }
     # Create test suite.
    [PSObject] CreateTestSuite([bool] $useTargetProject, [PSObject] $body, [int] $planId) {
        return $this.Request($useTargetProject, 'post', "testplan/Plans/$planId/suites", $this.apiVersion, $body)
    }

    # Delete test suite.
    [PSObject] DeleteTestSuite([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'delete', "testplan/Plans/$planId/suites/$suiteId", $this.apiVersion, $null)
    }
     # Get test suite by suite id.
    [PSObject] GetTestSuiteById([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/$planId/suites/$suiteId", $this.apiVersion, $null)
    }
     # Update test suite.
    [PSObject] UpdateTestSuite([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'patch', "testplan/Plans/$planId/suites/$suiteId", $this.apiVersion, $body)
    }

    # Add test cases to a suite with specified configurations
    [PSObject] AddTestCasesToSuite([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'post', "testplan/Plans/$planId/Suites/$suiteId/TestCase", $this.apiVersion, $body)
    }
     # Get Test Case List return those test cases which have all the configuration Ids as mentioned in the optional paramter. If configuration Ids is null, it return all the test cases
    [PSObject] GetTestCaseList([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/$planId/Suites/$suiteId/TestCase", $this.apiVersion, $null)
    }
     # Update the configurations for test cases
    [PSObject] UpdateSuiteTestCases([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'patch', "testplan/Plans/$planId/Suites/$suiteId/TestCase", $this.apiVersion, $body)
    }

    # Removes test cases from a suite based on the list of test case Ids provided.
    [PSObject] RemoveTestCasesFromSuite([bool] $useTargetProject, [int] $planId, [int] $suiteId, [string] $testCaseIds) {
        return $this.Request($useTargetProject, 'delete', "testplan/Plans/$planId/Suites/$suiteId/TestCase/$testCaseIds", $this.apiVersion, $null)
    }
     # Get Test Cases For a Suite.
    [PSObject] GetTestCase([bool] $useTargetProject, [int] $planId, [int] $suiteId, [string] $testCaseIds) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/$planId/Suites/$suiteId/TestCase/$testCaseIds", $this.apiVersion, $null)
    }

    # Update Test Points. This is used to Reset test point to active, update the outcome of a test point or update the tester of a test point
    [PSObject] UpdateTestPoints([bool] $useTargetProject, [PSObject] $body, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'patch', "testplan/Plans/$planId/Suites/$suiteId/TestPoint", $this.apiVersion, $body)
    }
     # Get all the points inside a suite based on some filters
    [PSObject] GetPointsList([bool] $useTargetProject, [int] $planId, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/$planId/Suites/$suiteId/TestPoint", $this.apiVersion, $null)
    }

    # Get a list of points based on point Ids provided.
    [PSObject] GetPoints([bool] $useTargetProject, [int] $planId, [int] $suiteId, [string] $pointIds) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/$planId/Suites/$suiteId/TestPoint/$pointIds", $this.apiVersion, $null)
    }

    # Clone test plan
    [PSObject] CloneTestPlan([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testplan/Plans/CloneOperation", $this.apiVersion, $body)
    }

    # Get clone information.
    [PSObject] GetCloneInformation([bool] $useTargetProject, [int] $cloneOperationId) {
        return $this.Request($useTargetProject, 'get', "testplan/Plans/CloneOperation/$cloneOperationId", $this.apiVersion, $null)
    }

    # Reorder test suite entries in the test suite.
    [PSObject] ReorderSuiteEntries([bool] $useTargetProject, [PSObject] $body, [int] $suiteId) {
        return $this.Request($useTargetProject, 'patch', "testplan/suiteentry/$suiteId", $this.apiVersion, $body)
    }
     # Get a list of test suite entries in the test suite.
    [PSObject] GetSuiteEntries([bool] $useTargetProject, [int] $suiteId) {
        return $this.Request($useTargetProject, 'get', "testplan/suiteentry/$suiteId", $this.apiVersion, $null)
    }

    # Clone test suite
    [PSObject] CloneTestSuite([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testplan/Suites/CloneOperation", $this.apiVersion, $body)
    }

    # Get clone information.
    [PSObject] GetSuiteCloneInformation([bool] $useTargetProject, [int] $cloneOperationId) {
        return $this.Request($useTargetProject, 'get', "testplan/Suites/CloneOperation/$cloneOperationId", $this.apiVersion, $null)
    }

    # Delete a test case.
    [PSObject] DeleteTestCase([bool] $useTargetProject, [int] $testCaseId) {
        return $this.Request($useTargetProject, 'delete', "testplan/testcases/$testCaseId", $this.apiVersion, $null)
    }

    # Get a list of test variables.
    [PSObject] GetTestVariables([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "testplan/variables", $this.apiVersion, $null)
    }
     # Create a test variable.
    [PSObject] CreateTestVariable([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "testplan/variables", $this.apiVersion, $body)
    }

    # Delete a test variable by its ID.
    [PSObject] DeleteTestVariable([bool] $useTargetProject, [int] $testVariableId) {
        return $this.Request($useTargetProject, 'delete', "testplan/variables/$testVariableId", $this.apiVersion, $null)
    }
     # Get a test variable by its ID.
    [PSObject] GetTestVariableById([bool] $useTargetProject, [int] $testVariableId) {
        return $this.Request($useTargetProject, 'get', "testplan/variables/$testVariableId", $this.apiVersion, $null)
    }
     # Update a test variable by its ID.
    [PSObject] UpdateTestVariable([bool] $useTargetProject, [PSObject] $body, [int] $testVariableId) {
        return $this.Request($useTargetProject, 'patch', "testplan/variables/$testVariableId", $this.apiVersion, $body)
    }

}


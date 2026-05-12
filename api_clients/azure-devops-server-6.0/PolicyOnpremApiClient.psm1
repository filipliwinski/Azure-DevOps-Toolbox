# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class PolicyOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0'

    # PolicyOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    PolicyOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of policy configurations in a project.The 'scope' parameter for this API should not be used, except for legacy compatability reasons. It returns specificallyscoped policies and does not support heirarchical nesting. Instead, use the /_apis/git/policy/configurations API, which providesfirst class scope filtering support.The optional `policyType` parameter can be used to filter the set of policies returned from this method.
    [PSObject] GetPolicyConfigurations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "policy/configurations", $this.apiVersion, $null)
    }

    # Delete a policy configuration by its ID.
    [PSObject] DeletePolicyConfiguration([bool] $useTargetProject, [int] $configurationId) {
        return $this.Request($useTargetProject, 'delete', "policy/configurations/$configurationId", $this.apiVersion, $null)
    }
     # Update a policy configuration by its ID.
    [PSObject] UpdatePolicyConfiguration([bool] $useTargetProject, [PSObject] $body, [int] $configurationId) {
        return $this.Request($useTargetProject, 'put', "policy/configurations/$configurationId", $this.apiVersion, $body)
    }
     # Create a policy configuration of a given policy type.
    [PSObject] CreatePolicyConfiguration([bool] $useTargetProject, [PSObject] $body, [int] $configurationId) {
        return $this.Request($useTargetProject, 'post', "policy/configurations/$configurationId", $this.apiVersion, $body)
    }
     # Get a policy configuration by its ID.
    [PSObject] GetPolicyConfiguration([bool] $useTargetProject, [int] $configurationId) {
        return $this.Request($useTargetProject, 'get', "policy/configurations/$configurationId", $this.apiVersion, $null)
    }

    # Retrieve all revisions for a given policy.
    [PSObject] GetPolicyConfigurationRevisions([bool] $useTargetProject, [int] $configurationId) {
        return $this.Request($useTargetProject, 'get', "policy/configurations/$configurationId/revisions", $this.apiVersion, $null)
    }

    # Retrieve a specific revision of a given policy by ID.
    [PSObject] GetPolicyConfigurationRevision([bool] $useTargetProject, [int] $configurationId, [int] $revisionId) {
        return $this.Request($useTargetProject, 'get', "policy/configurations/$configurationId/revisions/$revisionId", $this.apiVersion, $null)
    }

    # Retrieves a list of all the policy evaluation statuses for a specific pull request.Evaluations are retrieved using an artifact ID which uniquely identifies the pull request.To generate an artifact ID for a pull request, use this template:```vstfs:///CodeReview/CodeReviewId/{projectId}/{pullRequestId}```
    [PSObject] GetPolicyEvaluations([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "policy/evaluations", $this.apiVersion, $null)
    }

    # Requeue the policy evaluation.Some policies define a "requeue" action which performs some policy-specific operation.You can trigger this operation by updating an existing policy evaluation and setting thePolicyEvaluationRecord.Status field to Queued.Although any policy evaluation can be requeued, at present only build policies perform any actionin response. Requeueing a build policy will queue a new build to run (cancelling any existing build whichis running).
    [PSObject] RequeuePolicyEvaluation([bool] $useTargetProject, [string] $evaluationId) {
        return $this.Request($useTargetProject, 'patch', "policy/evaluations/$evaluationId", $this.apiVersion, $null)
    }
     # Gets the present evaluation state of a policy.Each policy which applies to a pull request will have an evaluation state which is specific to that policy runningin the context of that pull request. Each evaluation is uniquely identified via a Guid. You can find all the policyevaluations for a specific pull request using the List operation of this controller.
    [PSObject] GetPolicyEvaluation([bool] $useTargetProject, [string] $evaluationId) {
        return $this.Request($useTargetProject, 'get', "policy/evaluations/$evaluationId", $this.apiVersion, $null)
    }

    # Retrieve all available policy types.
    [PSObject] GetPolicyTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "policy/types", $this.apiVersion, $null)
    }

    # Retrieve a specific policy type by ID.
    [PSObject] GetPolicyType([bool] $useTargetProject, [string] $typeId) {
        return $this.Request($useTargetProject, 'get', "policy/types/$typeId", $this.apiVersion, $null)
    }

}


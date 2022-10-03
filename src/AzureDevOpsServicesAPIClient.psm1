# MIT License

# Copyright (c) 2021 Filip Liwiński

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

enum AuthFlow {
    Unknown = 0
    PersonalAccessToken = 1
}

class AzureDevOpsServicesAPIClient {
    [string] $APIVersion = '6.0'
    [string] $ServiceHost = 'https://dev.azure.com'
    [string] $ServiceHostVSRM = 'https://vsrm.dev.azure.com'
    [string] $Organization
    [string] $PersonalAccessToken
    [AuthFlow] $Auth

    AzureDevOpsServicesAPIClient([string] $organization, [string] $serviceHost, [string] $personalAccessToken) {
        
        if ('' -eq $serviceHost) {
            Write-Host "serviceHost not provided. Using $ServiceHost"
        } else {
            $this.ServiceHost = $serviceHost.TrimEnd('/')
        }
        
        $this.Organization = $organization
        $this.PersonalAccessToken = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$personalAccessToken"))
        $this.Auth = [AuthFlow]::PersonalAccessToken
    }

    #region Internals

    [PSObject] ComposeHeaders() {
        $authHeader = ''

        switch ($this.Auth) {
            { [AuthFlow]::PersonalAccessToken } {
                $authHeader = "Basic $($this.PersonalAccessToken)"
                break;
            }
            default {
                throw "Auth flow not supported."
            }
        }

        return @{
            'Authorization' = $authHeader
            'Content-Type' = 'application/json'
        }
    }

    [PSObject] CallRestAPI([string] $serviceHost, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {

        $requestHeaders = $this.ComposeHeaders()

        $uri = "$serviceHost/$($this.Organization)/$endpoint"

        if ($apiVersion) {
            if ($uri.Contains('?')) {
                $uri += '&'
            }
            else {
                $uri += '?'
            }
            $uri += "api-version=$apiVersion"
        }

        $bodyJson = $null
        if ($body) {
            $bodyJson = ConvertTo-Json $body -Depth 10
        }

        Write-Verbose "$($method.ToUpper()) $uri"

        return Invoke-RestMethod -Method $method -Uri $uri -Headers $requestHeaders -Body $bodyJson
    }

    [PSObject] Request([string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($this.ServiceHost, $method, $endpoint, $apiVersion, $body)
    }

    [PSObject] VSRMRequest([string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($this.ServiceHostVSRM, $method, $endpoint, $apiVersion, $body)
    }

    #endregion Internals
    #region Projects

    [PSObject] GetProjects() {
        return $this.Request('Get', '_apis/projects', $null, $null)
    }

    #endregion Projects
    #region TaskGroups

    [PSObject] GetTaskGroups([string] $projectName) {
        $taskGroups = $this.Request('Get', "$projectName/_apis/distributedtask/taskgroups", $this.APIVersion, $null)
        return $taskGroups.value
    }

    [PSObject] GetTaskGroupById([string] $projectName, [string] $taskGroupId) {
        $taskGroup = $this.Request('Get', "$projectName/_apis/distributedtask/taskgroups/$taskGroupId", $this.APIVersion, $null)

        if ($taskGroup.Count -eq 0) {
            return $null
        }

        return $taskGroup.value[0]
    }

    [PSObject] GetTaskGroupByName([string] $projectName, [string] $taskGroupName) {
        $taskGroups = $this.GetTaskGroups($projectName)

        if ($taskGroups.Count -eq 0) {
            return $null
        }

        return $taskGroups | Where-Object { $_.name -eq $taskGroupName }
    }

    [void] UpdateTaskGroup([string] $projectName, [PsObject] $taskGroup) {
        $this.Request('Put', "$projectName/_apis/distributedtask/taskgroups/$($taskGroup.id)", $this.APIVersion, $taskGroup)
    }

    #endregion TaskGroups
    #region VariableGroups

    [PSObject] AddVariableGroup([string] $projectName, [PsObject] $variableGroup) {
        $variableGroup = $this.Request('Post', "$projectName/_apis/distributedtask/variablegroups", $this.APIVersion, $variableGroup)
        return $variableGroup
    }

    [PSObject] GetVariableGroups([string] $projectName) {
        $variableGroups = $this.Request('Get', "$projectName/_apis/distributedtask/variablegroups", $this.APIVersion, $null)
        return $variableGroups.value
    }

    [PSObject] GetVariableGroupByName([string] $projectName, [string] $variableGroupName) {
        $variableGroups = $this.GetVariableGroups($projectName)

        if ($variableGroups.Count -eq 0) {
            return $null
        }

        return $variableGroups | Where-Object { $_.name -eq $variableGroupName }
    }

    [PSObject] GetVariableGroupById([string] $projectName, [int] $variableGroupId) {
        $variableGroup = $this.Request('Get', "$projectName/_apis/distributedtask/variablegroups/$variableGroupId", $this.APIVersion, $null)
        return $variableGroup
    }

    [PSObject] UpdateVariableGroup([string] $projectName, [PsObject] $variableGroup) {
        $variableGroup = $this.Request('Put', "$projectName/_apis/distributedtask/variablegroups/$($variableGroup.id)", $this.APIVersion, $variableGroup)
        return $variableGroup
    }

    #endregion VariableGroups
    #region BuildDefinitions

    [PSObject] GetBuildDefinitions([string] $projectName) {
        $definitions = $this.Request('Get', "$projectName/_apis/build/definitions", '6.0', $null)
        return $definitions.value
    }

    [PSObject] GetBuildDefinition([string] $projectName, [int] $definitionId) {
        $definition = $this.Request('Get', "$projectName/_apis/build/definitions/$definitionId", '6.0', $null)
        return $definition
    }

    #endregion BuildDefinitions
    #region ReleaseDefinitions

    [PSObject] GetReleaseDefinitions([string] $projectName) {
        $releaseDefinitions = $this.VSRMRequest('Get', "$projectName/_apis/release/definitions", $this.APIVersion, $null)
        return $releaseDefinitions.value
    }

    [PSObject] GetReleaseDefinition([string] $projectName, [int] $definitionId) {
        $definition = $this.VSRMRequest('Get', "$projectName/_apis/release/definitions/$definitionId", $this.APIVersion, $null)
        return $definition
    }

    #endregion ReleaseDefinitions
    #region Repositories

    # Create a git repository in a team project.
    [PSObject] CreateRepository([PSObject] $body, [string] $project) {
        return $this.Request('post', "$project/_apis/git/repositories", $this.APIVersion, $body)
    }

    [PSObject] GetRepositories([string] $projectName) {
        $repositories = $this.Request('Get', "$projectName/_apis/git/repositories", $this.APIVersion, $null)
        return $repositories.value
    }

    # Retrieve a pull request.
    [PSObject] GetPullRequest([string] $repositoryId, [int] $pullRequestId, [string] $project) {
        return $this.Request('get', "$project/_apis/git/repositories/$repositoryId/pullrequests/$pullRequestId", $this.APIVersion, $null)
    }

    # Create a pull request.
    [PSObject] CreatePullRequest([PSObject] $body, [string] $repositoryId, [string] $project) {
        return $this.Request('post', "$project/_apis/git/repositories/$repositoryId/pullrequests", $this.APIVersion, $body)
    }

    #endregion Repositories

    [PSObject] CreateRepository([string] $organization, [PSObject] $body, [string] $project, [string] $sourceRef) {
        return $this.Request('post', "$project/_apis/git/repositories", $this.APIVersion, $body)
    }

    #endregion Repositories
    #region Refs

    [psobject] GetRefs([string] $projectName, [string] $repositoryId) {
        $refs = $this.Request('Get', "$projectName/_apis/git/repositories/$repositoryId/refs", $this.APIVersion, $null)
        return $refs
    }

    #endregion Refs
    #region PolicyConfigurations

    [PSObject] GetPolicyConfiguration([string] $projectName, [string] $repositoryId, [string] $refName) {
        $refName = "refs/heads/$refName"
        $policy = $this.Request('Get', "$projectName/_apis/git/policy/configurations?repositoryId=$repositoryId&refName=$refName", '5.0-preview.1', $null)
        return $policy.value
    }

    #endregion PolicyConfigurations
}

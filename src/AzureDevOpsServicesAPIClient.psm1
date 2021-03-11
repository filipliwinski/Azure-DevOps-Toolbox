
enum AuthFlow {
    Unknown = 0
    PersonalAccessToken = 1
}

class AzureDevOpsServicesAPIClient {
    [string] $APIVersion = '6.0-preview.1'
    [string] $ServiceHost = 'https://dev.azure.com'
    [string] $ServiceHostVSRM = 'https://vsrm.dev.azure.com'
    [string] $Organization
    [string] $PersonalAccessToken
    [AuthFlow] $Auth

    AzureDevOpsServicesAPIClient([string] $organization, [string] $personalAccessToken) {
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
}

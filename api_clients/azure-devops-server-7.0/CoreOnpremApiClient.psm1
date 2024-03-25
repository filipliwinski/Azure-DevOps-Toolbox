# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class CoreOnpremApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.0'

    # CoreOnpremApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    CoreOnpremApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of processes.
    [PSObject] GetProcesses([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "process/processes", $this.apiVersion, $null)
    }

    # Get a process by ID.
    [PSObject] GetProcessById([bool] $useTargetProject, [string] $processId) {
        return $this.Request($useTargetProject, 'get', "process/processes/$processId", $this.apiVersion, $null)
    }

    # Queues a project to be created. Use the [GetOperation](../../operations/operations/get) to periodically check for create project status.
    [PSObject] QueueCreateProject([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "projects", $this.apiVersion, $body)
    }
     # Get all projects in the collection that the authenticated user has access to.
    [PSObject] GetProjects([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "projects", $this.apiVersion, $null)
    }

    # Update an existing project's name, abbreviation, description, or restore a project.
    [PSObject] UpdateProject([bool] $useTargetProject, [PSObject] $body, [string] $projectId) {
        return $this.Request($useTargetProject, 'patch', "projects/Id", $this.apiVersion, $body)
    }
     # Get project with the specified id or name, optionally including capabilities.
    [PSObject] GetProject([bool] $useTargetProject, [string] $projectId) {
        return $this.Request($useTargetProject, 'get', "projects/Id", $this.apiVersion, $null)
    }
     # Queues a project to be deleted. Use the [GetOperation](../../operations/operations/get) to periodically check for delete project status.
    [PSObject] QueueDeleteProject([bool] $useTargetProject, [string] $projectId) {
        return $this.Request($useTargetProject, 'delete', "projects/Id", $this.apiVersion, $null)
    }

    # Sets the avatar for the project.
    [PSObject] SetProjectAvatar([bool] $useTargetProject, [PSObject] $body, [string] $projectId) {
        return $this.Request($useTargetProject, 'put', "projects/Id/avatar", $this.apiVersion, $body)
    }
     # Removes the avatar for the project.
    [PSObject] RemoveProjectAvatar([bool] $useTargetProject, [string] $projectId) {
        return $this.Request($useTargetProject, 'delete', "projects/Id/avatar", $this.apiVersion, $null)
    }

    # Create, update, and delete team project properties.
    [PSObject] SetProjectProperties([bool] $useTargetProject, [string] $projectId, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "projects/Id/properties", $this.apiVersion, $body)
    }
     # Get a collection of team project properties.
    [PSObject] GetProjectProperties([bool] $useTargetProject, [string] $projectId) {
        return $this.Request($useTargetProject, 'get', "projects/Id/properties", $this.apiVersion, $null)
    }

    # Get a list of teams.
    [PSObject] GetTeams([bool] $useTargetProject, [string] $projectId) {
        return $this.Request($useTargetProject, 'get', "projects/Id/teams", $this.apiVersion, $null)
    }
     # Create a team in a team project.Possible failure scenariosInvalid project name/ID (project doesn't exist) 404Invalid team name or description 400Team already exists 400Insufficient privileges 400
    [PSObject] CreateTeam([bool] $useTargetProject, [PSObject] $body, [string] $projectId) {
        return $this.Request($useTargetProject, 'post', "projects/Id/teams", $this.apiVersion, $body)
    }

    # Update a team's name and/or description.
    [PSObject] UpdateTeam([bool] $useTargetProject, [PSObject] $body, [string] $projectId, [string] $teamId) {
        return $this.Request($useTargetProject, 'patch', "projects/Id/teams/$teamId", $this.apiVersion, $body)
    }
     # Delete a team.
    [PSObject] DeleteTeam([bool] $useTargetProject, [string] $projectId, [string] $teamId) {
        return $this.Request($useTargetProject, 'delete', "projects/Id/teams/$teamId", $this.apiVersion, $null)
    }
     # Get a specific team.
    [PSObject] GetTeam([bool] $useTargetProject, [string] $projectId, [string] $teamId) {
        return $this.Request($useTargetProject, 'get', "projects/Id/teams/$teamId", $this.apiVersion, $null)
    }

    # Get a list of members for a specific team.
    [PSObject] GetTeamMembersWithExtendedProperties([bool] $useTargetProject, [string] $projectId, [string] $teamId) {
        return $this.Request($useTargetProject, 'get', "projects/Id/teams/$teamId/members", $this.apiVersion, $null)
    }

    # Get a list of all teams.
    [PSObject] GetAllTeams([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "teams", $this.apiVersion, $null)
    }

}


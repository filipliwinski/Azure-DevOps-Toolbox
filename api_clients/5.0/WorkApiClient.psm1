# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class WorkApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.0'

    # WorkApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    WorkApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get available board columns in a project
    [PSObject] GetColumnSuggestedValues([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/boardcolumns", $this.apiVersion, $null)
    }

    # Get available board rows in a project
    [PSObject] GetRowSuggestedValues([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/boardrows", $this.apiVersion, $null)
    }

    # Add a new plan for the team
    [PSObject] CreatePlan([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "work/plans", $this.apiVersion, $body)
    }
     # Get the information for all the plans configured for the given team
    [PSObject] GetPlans([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/plans", $this.apiVersion, $null)
    }

    # Get the information for the specified plan
    [PSObject] GetPlan([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "work/plans/$id", $this.apiVersion, $null)
    }
     # Update the information for the specified plan
    [PSObject] UpdatePlan([bool] $useTargetProject, [PSObject] $body, [string] $id) {
        return $this.Request($useTargetProject, 'put', "work/plans/$id", $this.apiVersion, $body)
    }
     # Delete the specified plan
    [PSObject] DeletePlan([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'delete', "work/plans/$id", $this.apiVersion, $null)
    }

    # Get Delivery View Data
    [PSObject] GetDeliveryTimelineData([bool] $useTargetProject, [string] $id) {
        return $this.Request($useTargetProject, 'get', "work/plans/$id/deliverytimeline", $this.apiVersion, $null)
    }

    # Get process configuration
    [PSObject] GetProcessConfiguration([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "work/processconfiguration", $this.apiVersion, $null)
    }

    # Gets backlog configuration for a team
    [PSObject] GetBacklogConfigurations([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/backlogconfiguration", $this.apiVersion, $null)
    }

    # List all backlog levels
    [PSObject] GetBacklogs([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/backlogs", $this.apiVersion, $null)
    }

    # Get a list of work items within a backlog level
    [PSObject] GetBacklogLevelWorkItems([bool] $useTargetProject, [string] $team, [string] $backlogId) {
        return $this.Request($useTargetProject, 'get', "$team/work/backlogs/$backlogId/workItems", $this.apiVersion, $null)
    }

    # Get a backlog level
    [PSObject] GetBacklog([bool] $useTargetProject, [string] $team, [string] $id) {
        return $this.Request($useTargetProject, 'get', "$team/work/backlogs/$id", $this.apiVersion, $null)
    }

    # Get boards
    [PSObject] GetBoards([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards", $this.apiVersion, $null)
    }

    # Get board user settings for a board id
    [PSObject] GetBoardUserSettings([bool] $useTargetProject, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/boardusersettings", $this.apiVersion, $null)
    }
     # Update board user settings for the board idWe don't want stakeholders to update board settings (currently just autorefresh). The BacklogManagement feature check validates this.
    [PSObject] UpdateBoardUserSettings([bool] $useTargetProject, [PSObject] $body, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/boards/$board/boardusersettings", $this.apiVersion, $body)
    }

    # Get board card Rule settings for the board id or board by name
    [PSObject] GetBoardCardRuleSettings([bool] $useTargetProject, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/cardrulesettings", $this.apiVersion, $null)
    }
     # Update board card Rule settings for the board id or board by name
    [PSObject] UpdateBoardCardRuleSettings([bool] $useTargetProject, [PSObject] $body, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/boards/$board/cardrulesettings", $this.apiVersion, $body)
    }

    # Get board card settings for the board id or board by name
    [PSObject] GetBoardCardSettings([bool] $useTargetProject, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/cardsettings", $this.apiVersion, $null)
    }
     # Update board card settings for the board id or board by name
    [PSObject] UpdateBoardCardSettings([bool] $useTargetProject, [PSObject] $body, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/work/boards/$board/cardsettings", $this.apiVersion, $body)
    }

    # Get board charts
    [PSObject] GetBoardCharts([bool] $useTargetProject, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/charts", $this.apiVersion, $null)
    }

    # Get a board chart
    [PSObject] GetBoardChart([bool] $useTargetProject, [string] $board, [string] $name, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/charts/$name", $this.apiVersion, $null)
    }
     # Update a board chart
    [PSObject] UpdateBoardChart([bool] $useTargetProject, [PSObject] $body, [string] $board, [string] $name, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/boards/$board/charts/$name", $this.apiVersion, $body)
    }

    # Get columns on a board
    [PSObject] GetBoardColumns([bool] $useTargetProject, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/columns", $this.apiVersion, $null)
    }
     # Update columns on a board
    [PSObject] UpdateBoardColumns([bool] $useTargetProject, [PSObject] $body, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/work/boards/$board/columns", $this.apiVersion, $body)
    }

    # Get rows on a board
    [PSObject] GetBoardRows([bool] $useTargetProject, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$board/rows", $this.apiVersion, $null)
    }
     # Update rows on a board
    [PSObject] UpdateBoardRows([bool] $useTargetProject, [PSObject] $body, [string] $board, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/work/boards/$board/rows", $this.apiVersion, $body)
    }

    # Get board
    [PSObject] GetBoard([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/$id", $this.apiVersion, $null)
    }
     # Update board options
    [PSObject] SetBoardOptions([bool] $useTargetProject, [PSObject] $body, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/work/boards/$id", $this.apiVersion, $body)
    }

    # Returns the list of parent field filter model for the given list of workitem ids
    [PSObject] GetBoardMappingParentItems([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/boards/boardparents", $this.apiVersion, $null)
    }

    # Get a team's settings
    [PSObject] GetTeamSettings([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings", $this.apiVersion, $null)
    }
     # Update a team's settings
    [PSObject] UpdateTeamSettings([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/teamsettings", $this.apiVersion, $body)
    }

    # Get a team's iterations using timeframe filter
    [PSObject] GetTeamIterations([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/iterations", $this.apiVersion, $null)
    }
     # Add an iteration to the team
    [PSObject] PostTeamIteration([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/work/teamsettings/iterations", $this.apiVersion, $body)
    }

    # Delete a team's iteration by iterationId
    [PSObject] DeleteTeamIteration([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'delete', "$team/work/teamsettings/iterations/$id", $this.apiVersion, $null)
    }
     # Get team's iteration by iterationId
    [PSObject] GetTeamIteration([bool] $useTargetProject, [string] $id, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/iterations/$id", $this.apiVersion, $null)
    }

    # Get a team's capacity
    [PSObject] GetCapacities([bool] $useTargetProject, [string] $iterationId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/iterations/$iterationId/capacities", $this.apiVersion, $null)
    }
     # Replace a team's capacity
    [PSObject] ReplaceCapacities([bool] $useTargetProject, [PSObject] $body, [string] $iterationId, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/work/teamsettings/iterations/$iterationId/capacities", $this.apiVersion, $body)
    }

    # Get a team member's capacity
    [PSObject] GetCapacity([bool] $useTargetProject, [string] $iterationId, [string] $teamMemberId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/iterations/$iterationId/capacities/$teamMemberId", $this.apiVersion, $null)
    }
     # Update a team member's capacity
    [PSObject] UpdateCapacity([bool] $useTargetProject, [PSObject] $body, [string] $iterationId, [string] $teamMemberId, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/teamsettings/iterations/$iterationId/capacities/$teamMemberId", $this.apiVersion, $body)
    }

    # Get team's days off for an iteration
    [PSObject] GetTeamDaysOff([bool] $useTargetProject, [string] $iterationId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/iterations/$iterationId/teamdaysoff", $this.apiVersion, $null)
    }
     # Set a team's days off for an iteration
    [PSObject] UpdateTeamDaysOff([bool] $useTargetProject, [PSObject] $body, [string] $iterationId, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/teamsettings/iterations/$iterationId/teamdaysoff", $this.apiVersion, $body)
    }

    # Get work items for iteration
    [PSObject] GetIterationWorkItems([bool] $useTargetProject, [string] $iterationId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/iterations/$iterationId/workitems", $this.apiVersion, $null)
    }

    # Get a collection of team field values
    [PSObject] GetTeamFieldValues([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/work/teamsettings/teamfieldvalues", $this.apiVersion, $null)
    }
     # Update team field values
    [PSObject] UpdateTeamFieldValues([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/work/teamsettings/teamfieldvalues", $this.apiVersion, $body)
    }

}


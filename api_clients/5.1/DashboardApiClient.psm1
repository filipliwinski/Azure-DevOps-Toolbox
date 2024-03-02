# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class DashboardApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '5.1-preview'

    # DashboardApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    DashboardApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get all available widget metadata in alphabetical order.
    [PSObject] GetWidgetTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "dashboard/widgettypes", $this.apiVersion, $null)
    }

    # Get the widget metadata satisfying the specified contribution ID.
    [PSObject] GetWidgetMetadata([bool] $useTargetProject, [string] $contributionId) {
        return $this.Request($useTargetProject, 'get', "dashboard/widgettypes/$contributionId", $this.apiVersion, $null)
    }

    # Update the name and position of dashboards in the supplied group, and remove omitted dashboards. Does not modify dashboard content.
    [PSObject] ReplaceDashboards([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/dashboard/dashboards", $this.apiVersion, $body)
    }
     # Create the supplied dashboard.
    [PSObject] CreateDashboard([bool] $useTargetProject, [PSObject] $body, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/dashboard/dashboards", $this.apiVersion, $body)
    }
     # Get a list of dashboards.
    [PSObject] GetDashboards([bool] $useTargetProject, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/dashboard/dashboards", $this.apiVersion, $null)
    }

    # Replace configuration for the specified dashboard. Replaces Widget list on Dashboard, only if property is supplied.
    [PSObject] ReplaceDashboard([bool] $useTargetProject, [PSObject] $body, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/dashboard/dashboards/$dashboardId", $this.apiVersion, $body)
    }
     # Delete a dashboard given its ID. This also deletes the widgets associated with this dashboard.
    [PSObject] DeleteDashboard([bool] $useTargetProject, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'delete', "$team/dashboard/dashboards/$dashboardId", $this.apiVersion, $null)
    }
     # Get a dashboard by its ID.
    [PSObject] GetDashboard([bool] $useTargetProject, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/dashboard/dashboards/$dashboardId", $this.apiVersion, $null)
    }

    # Replace the widgets on specified dashboard with the supplied widgets.
    [PSObject] ReplaceWidgets([bool] $useTargetProject, [PSObject] $body, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/dashboard/dashboards/$dashboardId/widgets", $this.apiVersion, $body)
    }
     # Update the supplied widgets on the dashboard using supplied state. State of existing Widgets not passed in the widget list is preserved.
    [PSObject] UpdateWidgets([bool] $useTargetProject, [PSObject] $body, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/dashboard/dashboards/$dashboardId/widgets", $this.apiVersion, $body)
    }
     # Create a widget on the specified dashboard.
    [PSObject] CreateWidget([bool] $useTargetProject, [PSObject] $body, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'post', "$team/dashboard/dashboards/$dashboardId/widgets", $this.apiVersion, $body)
    }
     # Get widgets contained on the specified dashboard.
    [PSObject] GetWidgets([bool] $useTargetProject, [string] $dashboardId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/dashboard/dashboards/$dashboardId/widgets", $this.apiVersion, $null)
    }

    # Override the  state of the specified widget.
    [PSObject] ReplaceWidget([bool] $useTargetProject, [PSObject] $body, [string] $dashboardId, [string] $widgetId, [string] $team) {
        return $this.Request($useTargetProject, 'put', "$team/dashboard/dashboards/$dashboardId/widgets/$widgetId", $this.apiVersion, $body)
    }
     # Perform a partial update of the specified widget.
    [PSObject] UpdateWidget([bool] $useTargetProject, [PSObject] $body, [string] $dashboardId, [string] $widgetId, [string] $team) {
        return $this.Request($useTargetProject, 'patch', "$team/dashboard/dashboards/$dashboardId/widgets/$widgetId", $this.apiVersion, $body)
    }
     # Delete the specified widget.
    [PSObject] DeleteWidget([bool] $useTargetProject, [string] $dashboardId, [string] $widgetId, [string] $team) {
        return $this.Request($useTargetProject, 'delete', "$team/dashboard/dashboards/$dashboardId/widgets/$widgetId", $this.apiVersion, $null)
    }
     # Get the current state of the specified widget.
    [PSObject] GetWidget([bool] $useTargetProject, [string] $dashboardId, [string] $widgetId, [string] $team) {
        return $this.Request($useTargetProject, 'get', "$team/dashboard/dashboards/$dashboardId/widgets/$widgetId", $this.apiVersion, $null)
    }

}


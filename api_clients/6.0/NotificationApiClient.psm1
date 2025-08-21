# This file was auto-generated. Do not edit.

using module .\..\AzureDevOpsApiClient.psm1

class NotificationApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '6.0'

    # NotificationApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    NotificationApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of diagnostic logs for this service.
    [PSObject] ListLogs([bool] $useTargetProject, [string] $source, [string] $entryId) {
        return $this.Request($useTargetProject, 'get', "notification/diagnosticlogs/$source/entries/$entryId", $this.apiVersion, $null)
    }

    # List available event types for this service. Optionally filter by only event types for the specified publisher.
    [PSObject] ListEventTypes([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "notification/eventtypes", $this.apiVersion, $null)
    }

    # Get a specific event type.
    [PSObject] GetEventType([bool] $useTargetProject, [string] $eventType) {
        return $this.Request($useTargetProject, 'get', "notification/eventtypes/$eventType", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetSettings([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "notification/settings", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateSettings([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'patch', "notification/settings", $this.apiVersion, $body)
    }

    # Get delivery preferences of a notifications subscriber.
    [PSObject] GetSubscriber([bool] $useTargetProject, [string] $subscriberId) {
        return $this.Request($useTargetProject, 'get', "notification/subscribers/$subscriberId", $this.apiVersion, $null)
    }
     # Update delivery preferences of a notifications subscriber.
    [PSObject] UpdateSubscriber([bool] $useTargetProject, [PSObject] $body, [string] $subscriberId) {
        return $this.Request($useTargetProject, 'patch', "notification/subscribers/$subscriberId", $this.apiVersion, $body)
    }

    # Query for subscriptions. A subscription is returned if it matches one or more of the specified conditions.
    [PSObject] QuerySubscriptions([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "notification/subscriptionquery", $this.apiVersion, $body)
    }

    # Create a new subscription.
    [PSObject] CreateSubscription([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "notification/subscriptions", $this.apiVersion, $body)
    }
     # Get a list of notification subscriptions, either by subscription IDs or by all subscriptions for a given user or group.
    [PSObject] ListSubscriptions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "notification/subscriptions", $this.apiVersion, $null)
    }

    # Get a notification subscription by its ID.
    [PSObject] GetSubscription([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'get', "notification/subscriptions/$subscriptionId", $this.apiVersion, $null)
    }
     # Delete a subscription.
    [PSObject] DeleteSubscription([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'delete', "notification/subscriptions/$subscriptionId", $this.apiVersion, $null)
    }
     # Update an existing subscription. Depending on the type of subscription and permissions, the caller can update the description, filter settings, channel (delivery) settings and more.
    [PSObject] UpdateSubscription([bool] $useTargetProject, [PSObject] $body, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'patch', "notification/subscriptions/$subscriptionId", $this.apiVersion, $body)
    }

    # Get the diagnostics settings for a subscription.
    [PSObject] GetSubscriptionDiagnostics([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'get', "notification/subscriptions/$subscriptionId/diagnostics", $this.apiVersion, $null)
    }
     # Update the diagnostics settings for a subscription.
    [PSObject] UpdateSubscriptionDiagnostics([bool] $useTargetProject, [PSObject] $body, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'put', "notification/subscriptions/$subscriptionId/diagnostics", $this.apiVersion, $body)
    }

    # Update the specified user's settings for the specified subscription. This API is typically used to opt in or out of a shared subscription. User settings can only be applied to shared subscriptions, like team subscriptions or default subscriptions.
    [PSObject] UpdateSubscriptionUserSettings([bool] $useTargetProject, [PSObject] $body, [string] $subscriptionId, [string] $userId) {
        return $this.Request($useTargetProject, 'put', "notification/Subscriptions/$subscriptionId/usersettings/$userId", $this.apiVersion, $body)
    }

    # Get available subscription templates.
    [PSObject] GetSubscriptionTemplates([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "notification/subscriptiontemplates", $this.apiVersion, $null)
    }

}


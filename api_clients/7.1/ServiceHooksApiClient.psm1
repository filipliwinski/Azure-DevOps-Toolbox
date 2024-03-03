# This file was auto generated. Do not edit.

using module .\..\..\..\src\AzureDevOpsApiClient.psm1

class ServiceHooksApiClient : AzureDevOpsApiClient {
    [string] $apiVersion = '7.1-preview'

    # ServiceHooksApiClient([string] $serviceHost, [string] $organization, [string] $projectName, [string] $personalAccessToken)
    #     : base ($serviceHost, $organization, $projectName, $personalAccessToken, $serviceHost, $organization, $projectName, $personalAccessToken) {}

    ServiceHooksApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken, [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken)
        : base ($sourceServiceHost, $sourceOrganization, $sourceProjectName, $sourcePersonalAccessToken, $targetServiceHost, $targetOrganization, $targetProjectName, $targetPersonalAccessToken) {}

    # Get a list of available service hook consumer services. Optionally filter by consumers that support at least one event type from the specific publisher.
    [PSObject] ListConsumers([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "hooks/consumers", $this.apiVersion, $null)
    }

    # Get a specific consumer service. Optionally filter out consumer actions that do not support any event types for the specified publisher.
    [PSObject] GetConsumer([bool] $useTargetProject, [string] $consumerId) {
        return $this.Request($useTargetProject, 'get', "hooks/consumers/$consumerId", $this.apiVersion, $null)
    }

    # Get a list of consumer actions for a specific consumer.
    [PSObject] ListConsumerActions([bool] $useTargetProject, [string] $consumerId) {
        return $this.Request($useTargetProject, 'get', "hooks/consumers/$consumerId/actions", $this.apiVersion, $null)
    }

    # Get details about a specific consumer action.
    [PSObject] GetConsumerAction([bool] $useTargetProject, [string] $consumerId, [string] $consumerActionId) {
        return $this.Request($useTargetProject, 'get', "hooks/consumers/$consumerId/actions/$consumerActionId", $this.apiVersion, $null)
    }

    # Query for notifications. A notification includes details about the event, the request to and the response from the consumer service.
    [PSObject] QueryNotifications([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "hooks/notificationsquery", $this.apiVersion, $body)
    }

    # Get a list of publishers.
    [PSObject] ListPublishers([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "hooks/publishers", $this.apiVersion, $null)
    }

    # Get a specific service hooks publisher.
    [PSObject] GetPublisher([bool] $useTargetProject, [string] $publisherId) {
        return $this.Request($useTargetProject, 'get', "hooks/publishers/$publisherId", $this.apiVersion, $null)
    }

    # Get the event types for a specific publisher.
    [PSObject] ListEventTypes([bool] $useTargetProject, [string] $publisherId) {
        return $this.Request($useTargetProject, 'get', "hooks/publishers/$publisherId/eventtypes", $this.apiVersion, $null)
    }

    # Get a specific event type.
    [PSObject] GetEventType([bool] $useTargetProject, [string] $publisherId, [string] $eventTypeId) {
        return $this.Request($useTargetProject, 'get', "hooks/publishers/$publisherId/eventtypes/$eventTypeId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] QueryInputValues([bool] $useTargetProject, [PSObject] $body, [string] $publisherId) {
        return $this.Request($useTargetProject, 'post', "hooks/publishers/$publisherId/inputValuesQuery", $this.apiVersion, $body)
    }

    # Query for service hook publishers.
    [PSObject] QueryPublishers([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "hooks/publishersquery", $this.apiVersion, $body)
    }

    # Create a subscription.
    [PSObject] CreateSubscription([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "hooks/subscriptions", $this.apiVersion, $body)
    }
     # Get a list of subscriptions.
    [PSObject] ListSubscriptions([bool] $useTargetProject) {
        return $this.Request($useTargetProject, 'get', "hooks/subscriptions", $this.apiVersion, $null)
    }

    # Get a specific service hooks subscription.
    [PSObject] GetSubscription([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'get', "hooks/subscriptions/$subscriptionId", $this.apiVersion, $null)
    }
     # Update a subscription. <param name="subscriptionId">ID for a subscription that you wish to update.</param>
    [PSObject] ReplaceSubscription([bool] $useTargetProject, [PSObject] $body, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'put', "hooks/subscriptions/$subscriptionId", $this.apiVersion, $body)
    }
     # Delete a specific service hooks subscription.
    [PSObject] DeleteSubscription([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'delete', "hooks/subscriptions/$subscriptionId", $this.apiVersion, $null)
    }

    # empty
    [PSObject] GetSubscriptionDiagnostics([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'get', "hooks/subscriptions/$subscriptionId/diagnostics", $this.apiVersion, $null)
    }
     # empty
    [PSObject] UpdateSubscriptionDiagnostics([bool] $useTargetProject, [PSObject] $body, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'put', "hooks/subscriptions/$subscriptionId/diagnostics", $this.apiVersion, $body)
    }

    # Get a list of notifications for a specific subscription. A notification includes details about the event, the request to and the response from the consumer service.
    [PSObject] GetNotifications([bool] $useTargetProject, [string] $subscriptionId) {
        return $this.Request($useTargetProject, 'get', "hooks/subscriptions/$subscriptionId/notifications", $this.apiVersion, $null)
    }

    # Get a specific notification for a subscription.
    [PSObject] GetNotification([bool] $useTargetProject, [string] $subscriptionId, [int] $notificationId) {
        return $this.Request($useTargetProject, 'get', "hooks/subscriptions/$subscriptionId/notifications/$notificationId", $this.apiVersion, $null)
    }

    # Query for service hook subscriptions.
    [PSObject] CreateSubscriptionsQuery([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "hooks/subscriptionsquery", $this.apiVersion, $body)
    }

    # Sends a test notification. This is useful for verifying the configuration of an updated or new service hooks subscription.
    [PSObject] CreateTestNotification([bool] $useTargetProject, [PSObject] $body) {
        return $this.Request($useTargetProject, 'post', "hooks/testnotifications", $this.apiVersion, $body)
    }

}


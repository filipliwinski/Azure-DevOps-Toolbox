# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

enum AuthFlow {
    Unknown = 0
    PersonalAccessToken = 1
}

# Base API client used by all auto-generated clients
class AzureDevOpsApiClient {
    [string] $SourceServiceHost = 'https://dev.azure.com'
    [string] $SourceServiceHostVSRM = 'https://vsrm.dev.azure.com'
    [string] $SourceOrganization
    [string] $SourceProjectName
    [string] $SourcePersonalAccessToken
    [string] $TargetServiceHost = 'https://dev.azure.com'
    [string] $TargetServiceHostVSRM = 'https://vsrm.dev.azure.com'
    [string] $TargetOrganization
    [string] $TargetProjectName
    [string] $TargetPersonalAccessToken
    [AuthFlow] $Auth

    AzureDevOpsApiClient() {}

    AzureDevOpsApiClient([string] $sourceServiceHost, [string] $sourceOrganization, [string] $sourceProjectName, [string] $sourcePersonalAccessToken,
                         [string] $targetServiceHost, [string] $targetOrganization, [string] $targetProjectName, [string] $targetPersonalAccessToken) {

        if ('' -eq $sourceServiceHost) {
            Write-Verbose "sourceServiceHost not provided. Using $($this.SourceServiceHost)"
        } else {
            $this.SourceServiceHost = $SourceServiceHost.TrimEnd('/')
        }

        if ('' -eq $targetServiceHost) {
            Write-Verbose "targetServiceHost not provided. Using $($this.SourceServiceHost)"
        } else {
            $this.TargetServiceHost = $TargetServiceHost.TrimEnd('/')
        }

        $this.SourceOrganization = $sourceOrganization
        $this.SourceProjectName = $sourceProjectName
        $this.SourcePersonalAccessToken = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$sourcePersonalAccessToken"))

        $this.TargetOrganization = $targetOrganization
        $this.TargetProjectName = $targetProjectName
        $this.TargetPersonalAccessToken = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$targetPersonalAccessToken"))

        $this.Auth = [AuthFlow]::PersonalAccessToken
    }

    [PSObject] ComposeHeaders([nullable[bool]] $useTargetProject) {
        $authHeader = ''
        $personalAccessToken = $this.SourcePersonalAccessToken

        if ($useTargetProject) {
            $personalAccessToken = $this.TargetPersonalAccessToken
        }

        switch ($this.Auth) {
            { [AuthFlow]::PersonalAccessToken } {
                $authHeader = "Basic $personalAccessToken"
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

    [PSObject] CallRestAPI([bool] $isVSRMRequest, [nullable[bool]] $useTargetProject, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {

        $requestHeaders = $this.ComposeHeaders($useTargetProject)

        $serviceHost = $this.SourceServiceHost
        if ($isVSRMRequest) {
            $serviceHost = $this.SourceServiceHostVSRM
        }
        $uri = "$serviceHost/$($this.SourceOrganization)/$($this.SourceProjectName)/$endpoint"

        if ($null -eq $useTargetProject) {
            $uri = "$serviceHost/$($this.SourceOrganization)/$endpoint"
        } else {
            if ($useTargetProject) {
                $serviceHost = $this.TargetServiceHost
                if ($isVSRMRequest) {
                    $serviceHost = $this.TargetServiceHostVSRM
                }
                $uri = "$serviceHost/$($this.TargetOrganization)/$($this.TargetProjectName)/$endpoint"
            }
        }

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
            $bodyJson = ConvertTo-Json $body -Depth 100
        }

        Write-Verbose "$($method.ToUpper()) $uri"

        return Invoke-RestMethod -Method $method -Uri $uri -Headers $requestHeaders -Body $bodyJson
    }

    [PSObject] Request([nullable[bool]] $useTargetProject, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($false, $useTargetProject, $method, $endpoint, $apiVersion, $body)
    }

    [PSObject] VSRMRequest([nullable[bool]] $useTargetProject, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($true, $useTargetProject, $method, $endpoint, $apiVersion, $body)
    }
}

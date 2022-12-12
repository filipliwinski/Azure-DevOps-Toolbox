# MIT License

# Copyright (c) 2022 Filip Liwiński

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

    [PSObject] ComposeHeaders([bool] $useTargetProject) {
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

    [PSObject] CallRestAPI([bool] $isVSRMRequest, [bool] $useTargetProject, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {

        $requestHeaders = $this.ComposeHeaders($useTargetProject)

        if ($useTargetProject) {
            $serviceHost = $this.TargetServiceHost
            if ($isVSRMRequest) {
                $serviceHost = $this.TargetServiceHostVSRM
            }
            $uri = "$serviceHost/$($this.TargetOrganization)/$($this.TargetProjectName)/_apis/$endpoint"
        } else {
            $serviceHost = $this.SourceServiceHost
            if ($isVSRMRequest) {
                $serviceHost = $this.SourceServiceHostVSRM
            }
            $uri = "$serviceHost/$($this.SourceOrganization)/$($this.SourceProjectName)/_apis/$endpoint"
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

    [PSObject] Request([bool] $useTargetProject, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($false, $useTargetProject, $method, $endpoint, $apiVersion, $body)
    }

    [PSObject] VSRMRequest([bool] $useTargetProject, [string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($true, $useTargetProject, $method, $endpoint, $apiVersion, $body)
    }
}

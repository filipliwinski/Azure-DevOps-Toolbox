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
    [string] $ServiceHost = 'https://dev.azure.com'
    [string] $ServiceHostVSRM = 'https://vsrm.dev.azure.com'
    [string] $Organization
    [string] $Collection
    [string] $PersonalAccessToken
    [AuthFlow] $Auth

    AzureDevOpsApiClient() {}

    AzureDevOpsApiClient([string] $serviceHost, [string] $organization, [string] $personalAccessToken) {

        if ('' -eq $serviceHost) {
            Write-Host "serviceHost not provided. Using $ServiceHost"
        } else {
            $this.ServiceHost = $serviceHost.TrimEnd('/')
        }

        $this.Organization = $organization
        $this.Collection = $organization
        $this.PersonalAccessToken = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$personalAccessToken"))
        $this.Auth = [AuthFlow]::PersonalAccessToken
    }

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

        $uri = "$serviceHost/$endpoint"

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

    [PSObject] Request([string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($this.ServiceHost, $method, $endpoint, $apiVersion, $body)
    }

    [PSObject] VSRMRequest([string] $method, [string] $endpoint, [string] $apiVersion, [PSObject] $body) {
        return $this.CallRestAPI($this.ServiceHostVSRM, $method, $endpoint, $apiVersion, $body)
    }
}

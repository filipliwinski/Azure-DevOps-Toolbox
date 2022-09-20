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

. ".\git\Repositories.ps1"
. ".\git\Refs.ps1"

# Branch policies
$commentRequirementsDisplayName = 'Comment requirements'
$requireMergeStrategyDisplayName = 'Require a merge strategy'
$requiredReviewersDisplayName = 'Required reviewers'
$minimumNumberOfReviewersDisplayName = 'Minimum number of reviewers'

function Get-PolicyConfigurationRaw {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [string] $refName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $repository = Get-RepositoryByName -projectName $projectName -apiClient $apiClient -repositoryName $repositoryName

    $policy = $apiClient.GetPolicyConfiguration($projectName, $repository.id, $refName)

    return $policy
}

function Get-PolicyConfiguration {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [string] $refName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $rawPolicy = Get-PolicyConfigurationRaw -projectName $projectName -repositoryName $repositoryName -refName $refName -apiClient $apiClient
    
    if ("[]" -eq $rawPolicy) {
        return $null
    }

    $commentRequirements = $rawPolicy | Where-Object { $_.type.displayName -eq $commentRequirementsDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope
    $requireMergeStrategy = $rawPolicy | Where-Object { $_.type.displayName -eq $requireMergeStrategyDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope
    $requiredReviewers = $rawPolicy | Where-Object { $_.type.displayName -eq $requiredReviewersDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope
    $minimumNumberOfReviewers = $rawPolicy | Where-Object { $_.type.displayName -eq $minimumNumberOfReviewersDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope

    if ($null -eq $commentRequirements -and
        $null -eq $requireMergeStrategy -and
        $null -eq $requiredReviewers -and
        $null -eq $minimumNumberOfReviewers) {
        return $null
    }

    $policy = @{
        repository = $repositoryName
        branch     = $refName
        settings   = @{
            $commentRequirementsDisplayName      = $commentRequirements
            $requireMergeStrategyDisplayName     = $requireMergeStrategy
            $requiredReviewersDisplayName        = $requiredReviewers
            $minimumNumberOfReviewersDisplayName = $minimumNumberOfReviewers
        }
    }

    return $policy
}

function Get-RefsPolicyConfigurations {
    param(
        [string] $projectName,
        [string] $repositoryName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $repository = Get-RepositoryByName -projectName $projectName -repositoryName $repositoryName -apiClient $apiClient

    $refs = $(Get-Refs -projectName $projectName -repositoryId $repository.id -apiClient $apiClient).value
    
    $policies = @()
    $i = 1

    foreach ($ref in $refs) {
        $progress = [math]::floor($i / $refs.count * 100)
        
        Write-Progress -Activity "Getting policies..." -Status "$progress% Complete" -PercentComplete $progress
        $i++

        $policy = Get-PolicyConfiguration -projectName $projectName -repositoryName $repositoryName -refName $ref.name -apiClient $apiClient

        if ($null -ne $policy) {
            $policies += $policy
        }
    }

    return $policies
}

function Export-PolicyConfiguration {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [string] $refName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $policy = Get-PolicyConfiguration -projectName $projectName -repositoryName $repositoryName -refName $refName -apiClient $apiClient

    if ($null -ne $policy) {
        New-Item -ItemType Directory -Force -Path "$outputPath\$repositoryName" | Out-Null

        ConvertTo-Json $policy -Depth 100 > "$outputPath\$repositoryName\$refName.json"
    }
}

function Export-PolicyConfigurationRaw {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [string] $refName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $policy = Get-PolicyConfigurationRaw -projectName $projectName -repositoryName $repositoryName -refName $refName -apiClient $apiClient

    if ($policy.count -gt 0) {
        New-Item -ItemType Directory -Force -Path "$outputPath\$repositoryName" | Out-Null

        ConvertTo-Json $policy -Depth 100 > "$outputPath\$repositoryName\$refName.raw.json"
    }
    else {
        return ConvertTo-Json $policy -Depth 100
    }
}

function Compare-PolicyConfigurations {}

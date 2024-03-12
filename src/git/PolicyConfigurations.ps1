# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$policyApiClient = [PolicyOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

# # Branch policies
# $commentRequirementsDisplayName = 'Comment requirements'
# $requireMergeStrategyDisplayName = 'Require a merge strategy'
# $requiredReviewersDisplayName = 'Required reviewers'
# $minimumNumberOfReviewersDisplayName = 'Minimum number of reviewers'

<#
    .SYNOPSIS
        Create a policy configuration.

    .DESCRIPTION
        Create a policy configuration.

        Returns the created policy configuration.

    .PARAMETER useTargetProject
        Indicates whether to use the target project.
        If specified, the target project is used.

    .PARAMETER isEnabled
        Indicates whether the policy is enabled.

    .PARAMETER isBlocking
        Indicates whether the policy is blocking.

    .PARAMETER typeId
        The policy configuration type id.

    .PARAMETER settings
        The policy configuration settings.

    .OUTPUTS
        System.Object. Returns a PolicyConfiguration object with the new policy.

    .EXAMPLE
        PS> New-PolicyConfiguration -isEnabled $true -isBlocking $true -typeId '0609b952-1397-4640-95ec-e00a01b2c241' -settings $settings
        Creates a policy configuration with the provided properties in the current project.

    .EXAMPLE
        PS> New-PolicyConfiguration -useTargetProject
        Creates a policy configuration with the provided properties in the target project.

    .LINK
        Underlying API endpoint: https://learn.microsoft.com/en-us/rest/api/azure/devops/policy/configurations/create
#>
function New-PolicyConfiguration {
    param (
        [switch] $useTargetProject,
        [bool] $isEnabled,
        [bool] $isBlocking,
        [string] $typeId,
        [psobject] $settings
    )

    $policyConfiguration = @{
        isEnabled = $policy.isEnabled
        isBlocking = $policy.isBlocking
        type = @{
            id = $policy.type.id
        }
        settings = $settings
    }

    return $policyApiClient.CreatePolicyConfiguration($useTargetProject, $policyConfiguration, $null)
}

<#
    .SYNOPSIS
        Gets a list of policy configurations in a project.

    .DESCRIPTION
        Gets a list of policy configurations in a project.

        Returns the list of policy configurations.

    .PARAMETER useTargetProject
        Indicates whether to use the target project.
        If specified, the target project is used.

    .OUTPUTS
        System.Array. Returns an array ofs PolicyConfiguration objects.

    .EXAMPLE
        PS> Get-PolicyConfiguration
        Gets policy configurationsfrom the current project.

    .EXAMPLE
        PS> New-PolicyConfiguration -useTargetProject
        Gets policy configurations from the target project.

    .LINK
        Underlying API endpoint: https://learn.microsoft.com/en-us/rest/api/azure/devops/policy/configurations/list
#>
function Get-PolicyConfigurations {
    param (
        [switch] $useTargetProject
    )

    $policies = $policyApiClient.GetPolicyConfigurations($useTargetProject)

    return $policies.value
}

<#
    .SYNOPSIS
        Deletes a policy configuration with the provoded identifier.

    .DESCRIPTION
        Deletes a policy configuration with the provoded identifier.

    .PARAMETER useTargetProject
        Indicates whether to use the target project.
        If specified, the target project is used.

    .EXAMPLE
        PS> Remove-PolicyConfiguration -id 5
        Deletes the policy configurationsfrom with the provided id in the current project.

    .EXAMPLE
        PS> Remove-PolicyConfiguration -useTargetProject -id 5
        Deletes the policy configurationsfrom with the provided id in the target project.

    .LINK
        Underlying API endpoint: https://learn.microsoft.com/en-us/rest/api/azure/devops/policy/configurations/delete
#>
function Remove-PolicyConfiguration {
    param (
        [switch] $useTargetProject,
        [int] $id
    )

    $policyApiClient.DeletePolicyConfiguration($useTargetProject, $id)
}

<#
    .SYNOPSIS
        Retrieves all available policy types.

    .DESCRIPTION
        Retrieves all available policy types.

    .PARAMETER useTargetProject
        Indicates whether to use the target project.
        If specified, the target project is used.

    .EXAMPLE
        PS> Get-PolicyTypes
        Gets all available policy types in the current project.

    .EXAMPLE
        PS> Get-PolicyTypes -useTargetProject
        Gets all available policy types in the target project.

    .LINK
        Underlying API endpoint: https://learn.microsoft.com/en-us/rest/api/azure/devops/policy/types/list
#>
function Get-PolicyTypes {
    param (
        [switch] $useTargetProject
    )

    $policyTypes = $policyApiClient.GetPolicyTypes($useTargetProject)

    return $policyTypes.value
}

# function Get-PolicyConfigurationRaw {
#     param (
#         [switch] $useTargetProject,
#         [string] $repositoryId,
#         [string] $refName
#     )

#     $policy = $gitApiClient.GetPolicyConfiguration($useTargetProject, $repositoryId, $refName)

#     return $policy
# }

# function Get-PolicyConfiguration {
#     param (
#         [switch] $useTargetProject,
#         [string] $repositoryId,
#         [string] $refName
#     )

#     $rawPolicy = Get-PolicyConfigurationRaw -useTargetProject:$useTargetProject -repositoryName $repositoryId -refName $refName

#     if ("[]" -eq $rawPolicy) {
#         return $null
#     }

#     $commentRequirements = $rawPolicy | Where-Object { $_.type.displayName -eq $commentRequirementsDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope
#     $requireMergeStrategy = $rawPolicy | Where-Object { $_.type.displayName -eq $requireMergeStrategyDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope
#     $requiredReviewers = $rawPolicy | Where-Object { $_.type.displayName -eq $requiredReviewersDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope
#     $minimumNumberOfReviewers = $rawPolicy | Where-Object { $_.type.displayName -eq $minimumNumberOfReviewersDisplayName } | Select-Object -ExpandProperty settings | Select-Object -Property * -ExcludeProperty Scope

#     if ($null -eq $commentRequirements -and
#         $null -eq $requireMergeStrategy -and
#         $null -eq $requiredReviewers -and
#         $null -eq $minimumNumberOfReviewers) {
#         return $null
#     }

#     $policy = @{
#         repositoryId = $repositoryId
#         branch     = $refName
#         settings   = @{
#             $commentRequirementsDisplayName      = $commentRequirements
#             $requireMergeStrategyDisplayName     = $requireMergeStrategy
#             $requiredReviewersDisplayName        = $requiredReviewers
#             $minimumNumberOfReviewersDisplayName = $minimumNumberOfReviewers
#         }
#     }

#     return $policy
# }

# function Get-RefsPolicyConfigurations {
#     param(
#         [switch] $useTargetProject,
#         [string] $repositoryId
#     )

#     $refs = $(Get-Refs -useTargetProject:$useTargetProject -repositoryId $repositoryId).value

#     $policies = @()
#     $i = 1

#     foreach ($ref in $refs) {
#         $progress = [math]::floor($i / $refs.count * 100)

#         Write-Progress -Activity "Getting policies..." -Status "$progress% complete" -PercentComplete $progress
#         $i++

#         $policy = Get-PolicyConfiguration -useTargetProject:$useTargetProject -repositoryId $repositoryId -refName $ref.name

#         if ($null -ne $policy) {
#             $policies += $policy
#         }
#     }

#     return $policies
# }

# function Export-PolicyConfiguration {
#     param (
#         [switch] $useTargetProject,
#         [string] $repositoryId,
#         [string] $refName,
#         [string] $outputPath = ''
#     )

#     if ($null -eq $outputPath -or '' -eq $outputPath) {
#         $outputPath = "."
#     }

#     $policy = Get-PolicyConfiguration -useTargetProject:$useTargetProject -repositoryId $repositoryId -refName $refName

#     if ($null -ne $policy) {
#         New-Item -ItemType Directory -Force -Path "$outputPath\$repositoryId" | Out-Null

#         ConvertTo-Json $policy -Depth 100 > "$outputPath\$repositoryId\$refName.json"
#     }
# }

# function Export-PolicyConfigurationRaw {
#     param (
#         [switch] $useTargetProject,
#         [string] $repositoryId,
#         [string] $refName,
#         [string] $outputPath = ''
#     )

#     if ($null -eq $outputPath -or '' -eq $outputPath) {
#         $outputPath = "."
#     }

#     $policy = Get-PolicyConfigurationRaw -useTargetProject:$useTargetProject -repositoryId $repositoryId -refName $refName

#     if ($policy.count -gt 0) {
#         New-Item -ItemType Directory -Force -Path "$outputPath\$repositoryId" | Out-Null

#         ConvertTo-Json $policy -Depth 100 > "$outputPath\$repositoryId\$refName.raw.json"
#     }
#     else {
#         return ConvertTo-Json $policy -Depth 100
#     }
# }

# # TODO
# function Compare-PolicyConfigurations {}

# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$apiClient = [TaskAgentOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Add-VariableGroup {
    param(
        [switch] $useTargetProject,
        [PSObject] $variableGroup
    )

    return $apiClient.AddVariableGroup($useTargetProject, $variableGroup)
}

function Copy-VariableGroup {
    param(
        [switch] $useTargetProject,
        [int] $id
    )

    $variableGroup = $apiClient.GetVariableGroup($useTargetProject, $id)

    $newVariableGroup = @{
        "description" = $variableGroup.description
        "name" = "$($variableGroup.name) - copy"
        "providerData" = $variableGroup.providerData
        "type" = $variableGroup.type
        "variableGroupProjectReferences" = $variableGroup.variableGroupProjectReferences
        "variables" = $variableGroup.variables
    }

    return $apiClient.AddVariableGroup($useTargetProject, $newVariableGroup)
}

function Get-VariableGroup {
    param (
        [switch] $useTargetProject,
        [int] $id
    )

    $variableGroup = $apiClient.GetVariableGroup($useTargetProject, $id)
    return $variableGroup
}

# function Get-VariableGroupByName {
#     param (
#         [string] $projectName,
#         [AzureDevOpsServicesAPIClient] $apiClient,
#         [string] $variableGroupName
#     )

#     $variableGroup = $apiClient.GetVariableGroupByName($projectName, $variableGroupName)
#     return $variableGroup
# }

function Export-VariableGroup {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = '',
        [int] $id
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $variableGroup = $apiClient.GetVariableGroup($useTargetProject, $id)

    if ($null -ne $variableGroup) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    $name = $variableGroup.name
    ConvertTo-Json $variableGroup -Depth 100 > "$outputPath\$name.json"
}

function Export-VariableGroups {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = ''
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $variableGroups = $apiClient.GetVariableGroups($useTargetProject)

    if ($null -ne $variableGroups) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($variableGroup in $variableGroups) {
        ConvertTo-Json $variableGroup -Depth 100 > "$outputPath\$($variableGroup.name).json"
    }
}

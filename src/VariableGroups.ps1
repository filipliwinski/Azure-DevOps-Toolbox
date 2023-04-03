# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$taskAgentApiClient = [TaskAgentOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Add-VariableGroup {
    param(
        [switch] $useTargetProject,
        [PSObject] $variableGroup
    )

    return $taskAgentApiClient.AddVariableGroup($useTargetProject, $variableGroup)
}

function Copy-VariableGroup {
    param(
        [switch] $useTargetProject,
        [int] $id
    )
    $namePostfix = "- copy"

    $variableGroup = $taskAgentApiClient.GetVariableGroup($useTargetProject, $id)

    $newVariableGroup = @{
        "description" = $variableGroup.description
        "name" = "$($variableGroup.name) $namePostfix"
        "providerData" = $variableGroup.providerData
        "type" = $variableGroup.type
        "variableGroupProjectReferences" = $variableGroup.variableGroupProjectReferences
        "variables" = $variableGroup.variables
    }

    return $taskAgentApiClient.AddVariableGroup($useTargetProject, $newVariableGroup)
}

function Get-VariableGroup {
    param (
        [switch] $useTargetProject,
        [int] $id
    )

    $variableGroup = $taskAgentApiClient.GetVariableGroup($useTargetProject, $id)
    return $variableGroup
}

function Get-VariableGroups {
    param (
        [switch] $useTargetProject
    )

    $variableGroups = $taskAgentApiClient.GetVariableGroupsById($useTargetProject)
    return $variableGroups
}

function Export-VariableGroup {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = '',
        [int] $id
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $variableGroup = $taskAgentApiClient.GetVariableGroup($useTargetProject, $id)

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

    $variableGroups = $taskAgentApiClient.GetVariableGroups($useTargetProject)

    if ($null -ne $variableGroups) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($variableGroup in $variableGroups) {
        ConvertTo-Json $variableGroup -Depth 100 > "$outputPath\$($variableGroup.name).json"
    }
}

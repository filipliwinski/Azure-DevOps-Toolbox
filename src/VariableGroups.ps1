using module ./AzureDevOpsServicesAPIClient.psm1

function Add-VariableGroup {
    param(
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [PSObject] $variableGroup
    )

    return $apiClient.AddVariableGroup($projectName, $variableGroup)
}

function Copy-VariableGroup {
    param(
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [int] $sourceVariableGroupId
    )

    $sourceVariableGroup = $apiClient.GetVariableGroupById($projectName, $sourceVariableGroupId)

    $newVariableGroup = @{
        "description" = $sourceVariableGroup.description
        "name" = "$($sourceVariableGroup.name) - copy"
        "providerData" = $sourceVariableGroup.providerData
        "type" = $sourceVariableGroup.type
        "variableGroupProjectReferences" = $sourceVariableGroup.variableGroupProjectReferences
        "variables" = $sourceVariableGroup.variables
    }

    return $apiClient.AddVariableGroup($projectName, $newVariableGroup)
}

function Get-VariableGroup {
    param (
        [string] $projectName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient,
        [int] $variableGroupId
    )

    $variableGroup = $apiClient.GetVariableGroupById($projectName, $variableGroupId)
    return $variableGroup
}

function Get-VariableGroupByName {
    param (
        [string] $projectName,
        [AzureDevOpsServicesAPIClient] $apiClient,
        [string] $variableGroupName
    )

    $variableGroup = $apiClient.GetVariableGroupByName($projectName, $variableGroupName)
    return $variableGroup
}

function Export-VariableGroup {
    param (
        [string] $projectName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient,
        [int] $variableGroupId
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }
    
    $variableGroup = $apiClient.GetVariableGroupById($projectName, $variableGroupId)
    
    if ($null -ne $variableGroup) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    $name = $variableGroup.name
    ConvertTo-Json $variableGroup > "$outputPath\$name.json"
}


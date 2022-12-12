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
        [int] $variableGroupId
    )
    $namePostfix = ""

    $sourceVariableGroup = Get-VariableGroup -useTargetProject:$useTargetProject -variableGroupId $variableGroupId

    if (-not $useTargetProject) {
        $namePostfix = " - copy"
    }

    $newVariableGroup = @{
        "description" = $sourceVariableGroup.description
        "name" = "$($sourceVariableGroup.name)$namePostfix"
        "providerData" = $sourceVariableGroup.providerData
        "type" = $sourceVariableGroup.type
        "variables" = $sourceVariableGroup.variables
    }

    return $taskAgentApiClient.AddVariableGroup($useTargetProject, $newVariableGroup)
}

function Get-VariableGroups {
    param (
        [switch] $useTargetProject
    )

    $variableGroups = $taskAgentApiClient.GetVariableGroupsById($useTargetProject)
    return $variableGroups
}

function Get-VariableGroup {
    param (
        [switch] $useTargetProject,
        [int] $variableGroupId
    )

    $variableGroup = $taskAgentApiClient.GetVariableGroup($useTargetProject, $variableGroupId)
    return $variableGroup
}

function Get-VariableGroupByName {
    param (
        [string] $useTargetProject,
        [string] $variableGroupName
    )

    $variableGroups = Get-VariableGroups -useTargetProject:$useTargetProject

    if ($variableGroups.Count -eq 0) {
        return $null
    }

    return $variableGroups | Where-Object { $_.name -eq $variableGroupName }
}

function Export-VariableGroup {
    param (
        [string] $useTargetProject,
        [string] $outputPath = '',
        [int] $variableGroupId
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $variableGroup = Get-VariableGroup -useTargetProject:$useTargetProject -variableGroupId $variableGroupId

    if ($null -ne $variableGroup) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    $name = $variableGroup.name
    ConvertTo-Json $variableGroup -Depth 100 > "$outputPath\$name.json"
}

function Export-VariableGroups {
    param (
        [string] $useTargetProject,
        [string] $outputPath = ''
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $variableGroups = Get-VariableGroups -useTargetProject:$useTargetProject

    if ($null -ne $variableGroups) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($variableGroup in $variableGroups) {
        ConvertTo-Json $variableGroup -Depth 100 > "$outputPath\$($variableGroup.name).json"
    }
}

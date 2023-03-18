# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

# The API specification is stored in this location to avoid too long file names
$localRepoLocation = "c:/temp/vsts-rest-api-specs"

# Include fake API Clients for a specific API version
. ".\src\ApiClientFakes\azure-devops-server-6.0.ps1"

. ".\src\VariableGroups.ps1"

Describe "Test-VariableGroups" {

    BeforeAll {
    }

    Context "Add-VariableGroup" {
        $jsonSpec = Get-Content -Path "$localRepoLocation/specification/distributedTask/azure-devops-server-6.0/httpExamples/variablegroups/POST_CreateVariableGroup-onprem.json"
        $spec = $jsonSpec | ConvertFrom-Json

        $inputData = $spec.parameters.body

        It "Should add a new variable group" {
            $useTargetProject = $false
            $variableGroup = @{
                "description" = $inputData.description
                "name" = $inputData.name
                "providerData" = $inputData.providerData
                "type" = $inputData.type
                "variableGroupProjectReferences" = $inputData.variableGroupProjectReferences
                "variables" = $inputData.variables
            }

            $result = Add-VariableGroup -useTargetProject $useTargetProject -variableGroup $variableGroup

            $result | Should Be $variableGroup
        }
    }
}

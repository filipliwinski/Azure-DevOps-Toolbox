# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

$releaseApiClient = [ReleaseOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken,
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Export-ReleaseDefinitions {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = '',
        [bool] $expand = $false
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $definitions = $releaseApiClient.GetReleaseDefinitions($useTargetProject)

    if ($expand) {
        for ($i = 0; $i -lt $definitions.Count; $i++) {
            $definitions[$i] = $releaseApiClient.GetReleaseDefinition($useTargetProject, $definitions[$i].id)
        }
    }

    if ($definitions.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($definition in $definitions) {
        $name = $definition.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $definition -Depth 100 > "$outputPath\$name.json"
    }
}

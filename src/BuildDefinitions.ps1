

function Export-BuildDefinitions {
    param (
        [string] $projectName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient,
        [bool] $expand = $false
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }
    
    $definitions = $apiClient.GetBuildDefinitions($projectName)

    if ($expand) {
        for ($i = 0; $i -lt $definitions.Count; $i++) {
            $definitions[$i] = $apiClient.GetBuildDefinition($projectName, $definitions[$i].id)
        }
    }

    if ($definitions.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($definition in $definitions) {
        $name = $definition.name -replace '\*','_'
        ConvertTo-Json $definition -Depth 100 > "$outputPath\$name.json"
    }
}
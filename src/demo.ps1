using module .\src\AzureDevOpsServicesAPIClient.psm1

$organizationName = '<put the name of the organization here>'
$projectName = '<put the name of the project here>'
$patToken = '<put the Personal Access Token here>'

. .\src\TaskGroups.ps1
. .\src\VariableGroups.ps1
. .\src\BuildDefinitions.ps1
. .\src\ReleaseDefinitions.ps1

$apiClient = [AzureDevOpsServicesAPIClient]::new($organizationName, $patToken)

$VerbosePreference = "Continue"

Export-BuildDefinitions -projectName $projectName -outputpath '.\buildDefinitions' -apiClient $apiClient -expand $true
Export-ReleaseDefinitions -projectName $projectName -outputpath '.\releaseDefinitions' -apiClient $apiClient -expand $true
Export-TaskGroups -projectName $projectName -outputpath '.\taskGroups' -apiClient $apiClient
Export-VariableGroups -projectName $projectName -outputpath '.\variableGroups' -apiClient $apiClient

$VerbosePreference = "SilentlyContinue"
# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

# Include API Clients for a specific API version, e.g.: azure-devops-server-6.0
. ".\..\auto_generated\ApiClients\<provide the target API version>.ps1"

$organization = '<put the name of the organization here>'
$projectName = '<put the name of the project here>'
$patToken = '<put the Personal Access Token here>'
# Uncomment the line below to point to your local Azure DevOps Server.
# By default points to Azure DevOps Services URL.
# $tfsServiceHost = '<put the URL of your ADO Server here - {server:port}/tfs>'

# # OPTIONAL: Specify another ADO project as a target
# # This instance will be used when executing commands with the -useTargetProject flag.
# $targetOrganization = '<put the name of the target organization here>'
# $targetProjectName = '<put the name of the target project here>'
# $targetPatToken = '<put the Personal Access Token here>'
# # Uncomment the line below to point to your local Azure DevOps Server.
# # By default points to Azure DevOps Services URL.
# $targetTfsServiceHost = '<put the URL of your target ADO Server here - {server:port}/tfs>'

. .\TaskGroups.ps1
. .\VariableGroups.ps1
. .\BuildDefinitions.ps1
. .\ReleaseDefinitions.ps1
. .\git\Repositories.ps1
. .\git\PolicyConfigurations.ps1

$VerbosePreference = "Continue"   # Show verbose logs

Export-Definitions -outputpath '.\temp\buildDefinitions' -expand $true
Export-ReleaseDefinitions -outputpath '.\temp\releaseDefinitions' -expand $true
Export-TaskGroups -outputpath '.\temp\taskGroups'
Export-VariableGroups -outputpath '.\temp\variableGroups'
Export-Repositories -outputpath '.\temp\repositories'
Export-PolicyConfigurationRaw -repositoryName "<put the name of the repository here>" -refName "<put the name of the branch here>" -outputpath '.\temp\policyConfigurations'
Export-PolicyConfiguration -repositoryName "<put the name of the repository here>" -refName "<put the name of the branch here>" -outputpath '.\temp\policyConfigurations'

$VerbosePreference = "SilentlyContinue"

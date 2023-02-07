# MIT License

# Copyright (c) 2021-2023 Filip Liwiński

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

# Include API Clients for a specific API version
. ".\ApiClients\azure-devops-server-6.0.ps1"

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

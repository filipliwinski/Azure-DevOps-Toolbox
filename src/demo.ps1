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

using module .\src\AzureDevOpsServicesAPIClient.psm1

$organizationName = '<put the name of the organization here>'
$projectName = '<put the name of the project here>'
$patToken = '<put the Personal Access Token here>'
# Uncomment the line below to point to your local Azure DevOps Server.
# By default points to Azure DevOps Services URL.
# $serviceHost = '<put the URL of your ADO Server here - {server:port}/tfs>'

. .\TaskGroups.ps1
. .\VariableGroups.ps1
. .\BuildDefinitions.ps1
. .\ReleaseDefinitions.ps1
. .\git\Repositories.ps1
. .\git\PolicyConfigurations.ps1

$apiClient = [AzureDevOpsServicesAPIClient]::new($organizationName, $serviceHost, $patToken)

$VerbosePreference = "Continue"   # Show verbose logs

Export-BuildDefinitions -projectName $projectName -outputpath '.\temp\buildDefinitions' -apiClient $apiClient -expand $true
Export-ReleaseDefinitions -projectName $projectName -outputpath '.\temp\releaseDefinitions' -apiClient $apiClient -expand $true
Export-TaskGroups -projectName $projectName -outputpath '.\temp\taskGroups' -apiClient $apiClient
Export-VariableGroups -projectName $projectName -outputpath '.\temp\variableGroups' -apiClient $apiClient
Export-Repositories -projectName $projectName -outputpath '.\temp\repositories' -apiClient $apiClient
Export-PolicyConfigurationRaw -projectName $projectName -repositoryName "<put the name of the repository here>" -refName "<put the name of the branch here>" -outputpath '.\temp\policyConfigurations' -apiClient $apiClient
Export-PolicyConfiguration -projectName $projectName -repositoryName "<put the name of the repository here>" -refName "<put the name of the branch here>" -outputpath '.\temp\policyConfigurations' -apiClient $apiClient

$VerbosePreference = "SilentlyContinue"

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

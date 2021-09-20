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

. ".\src\git\Repositories.ps1"

function List-PolicyConfiguration {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [string] $refName,
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    $repository = Get-RepositoryByName -projectName $projectName -apiClient $apiClient -repositoryName $repositoryName

    $policy = $apiClient.GetPolicyConfiguration($projectName, $repository.id, $refName)

    return $policy
}

function Export-PolicyConfiguration {
    param (
        [string] $projectName,
        [string] $repositoryName,
        [string] $refName,
        [string] $outputPath = '',
        [AzureDevOpsServicesAPIClient] $apiClient
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $repository = Get-RepositoryByName -projectName $projectName -apiClient $apiClient -repositoryName $repositoryName

    $policy = $apiClient.GetPolicyConfiguration($projectName, $repository.id, $refName)

    if ($policy.count -gt 0) {
        New-Item -ItemType Directory -Force -Path "$outputPath\$($repository.name)" | Out-Null

        ConvertTo-Json $policy -Depth 100 > "$outputPath\$($repository.name)\$refName.json"
    }
}

function Compare-PolicyConfigurations {}

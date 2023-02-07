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

$apiClient = [TaskAgentOnpremApiClient]::new($tfsServiceHost, $organization, $projectName, $patToken, 
                                    $targetTfsServiceHost, $targetOrganization, $targetProjectName, $targetPatToken)

function Export-TaskGroups {
    param (
        [switch] $useTargetProject,
        [string] $outputPath = ''
    )

    if ($null -eq $outputPath -or '' -eq $outputPath) {
        $outputPath = "."
    }

    $taskGroups = $apiClient.GetTaskGroups($useTargetProject)

    if ($taskGroups.count -gt 0) {
        New-Item -ItemType Directory -Force -Path $outputPath | Out-Null
    }

    foreach ($taskGroup in $taskGroups) {
        $name = $taskGroup.name -replace '[\[\]\<\>\:\"\/\\\|\?\*]', '_'
        ConvertTo-Json $taskGroup -Depth 100 > "$outputPath\$name.json"
    }
}

# function Update-TaskGroup {
#     param(
#         [string] $sourceTaskGroupName,
#         [string] $destinationTaskGroupName,
#         [string] $comment
#     )

#     $sourceTaskGroup = $apiClient.GetTaskGroupByName($projectName, $sourceTaskGroupName)
#     $destinationTaskGroup = $apiClient.GetTaskGroupByName($projectName, $destinationTaskGroupName)

#     $destinationTaskGroup.description = $sourceTaskGroup.description
#     $destinationTaskGroup.category = $sourceTaskGroup.category
#     $destinationTaskGroup.inputs = $sourceTaskGroup.inputs
#     $destinationTaskGroup.tasks = $sourceTaskGroup.tasks
#     $destinationTaskGroup.comment = $comment

#     $apiClient.UpdateTaskGroup($projectName, $destinationTaskGroup)
# }

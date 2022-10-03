using module .\AzureDevOpsServicesAPIClient.psm1

. .\git\Repositories.ps1

function Migrate-Project {
    param (
        [PSObject] $source,
        [PSObject] $destination
    )
    
    $sourceApiClient = [AzureDevOpsServicesAPIClient]::new($source.organizationName, $source.serviceHost, $source.patToken)
    $destinationApiClient = [AzureDevOpsServicesAPIClient]::new($destination.organizationName, $destination.serviceHost, $destination.patToken)

    Migrate-Repositories -sourceProjectName $source.projectName -sourceApiClient $sourceApiClient  -destinationProjectName $destination.projectName -destinationApiClient $destinationApiClient -destinationProjectId $destination.projectId

    # WIP: migrate PRs
    $pullRequestId = 248379

    $sourcePr = Get-PullRequest -projectName $sourceProjectName -repositoryId $sourceRepositoryId -pullRequestId $pullRequestId -apiClient $sourceApiClient | ConvertTo-Json -depth 10

    Write-Host $sourcePr

    # TODO: Compose object from $sourcePr
    $targetPr = @{
    "sourceRefName" = $sourcePr.sourceRefName
    "targetRefName" = $sourcePr.targetRefName
    }

    $outputPr = Create-PullRequest -projectName $targetProjectName -repositoryId $targetReporitoryId -body $sourcePr -apiClient $targetApiClient
}

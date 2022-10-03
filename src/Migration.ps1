using module .\AzureDevOpsServicesAPIClient.psm1

. .\git\Repositories.ps1

function Migrate-Project {
    param (
        [PSObject] $source,
        [PSObject] $destination
    )
    
    $sourceApiClient = [AzureDevOpsServicesAPIClient]::new($source.organizationName, $source.serviceHost, $source.patToken)
    $destinationApiClient = [AzureDevOpsServicesAPIClient]::new($destination.organizationName, $destination.serviceHost, $destination.patToken)

    Write-Output $sourceApiClient
    Write-Output $destinationApiClient
    Migrate-Repositories -sourceProjectName $source.projectName -sourceApiClient $sourceApiClient  -destinationProjectName $destination.projectName -destinationApiClient $destinationApiClient -destinationProjectId $destination.projectId
}

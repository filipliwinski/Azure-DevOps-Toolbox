using module .\AzureDevOpsServicesAPIClient.psm1

. .\git\Repositories.ps1
. .\BuildDefinitions.ps1

$repositoriesToExcludeFilePath = '.\local_config\Migration\repositoriesToExclude.txt'

function Import-Project {
    param (
        [PSObject] $source,
        [PSObject] $destination
    )
    
    $sourceApiClient = [AzureDevOpsServicesAPIClient]::new($source.organizationName, $source.serviceHost, $source.patToken)
    $destinationApiClient = [AzureDevOpsServicesAPIClient]::new($destination.organizationName, $destination.serviceHost, $destination.patToken)

    Write-Output $sourceApiClient
    Write-Output $destinationApiClient
    # Export-BuildDefinitions -projectName 'NCDPP' -outputpath '.\temp\newBuildDefinitions' -apiClient $destinationApiClient -expand $true
    # exit
    Import-Repositories -sourceProjectName $source.projectName -sourceApiClient $sourceApiClient  -destinationProjectName $destination.projectName -destinationApiClient $destinationApiClient -destinationProjectId $destination.projectId
}

function Move-Repositories {
    
    if (-Not (Test-Path $repositoriesToExcludeFilePath)) {
        throw "Required configuration file not found: $repositoriesToExcludeFilePath"
    }

    repositoriesToExclude = Get-Content -Path $repositoriesToExcludeFilePath
    
    Copy-Repositories -useTargetProject:$true -repositoriesToExclude repositoriesToExclude
}

function Move-Definitions {
    
    Copy-Definitions -useTargetProject:$true
}
# using module .\AzureDevOpsServicesAPIClient.psm1

. .\git\Repositories.ps1
. .\BuildDefinitions.ps1

$repositoriesToExcludeFilePath = '.\local_config\Migration\repositoriesToExclude.txt'
$definitionsToExcludeFilePath = '.\local_config\Migration\definitionsToExclude.txt'

# function Import-Project {
#     param (
#         [PSObject] $source,
#         [PSObject] $destination
#     )
    
#     $sourceApiClient = [AzureDevOpsServicesAPIClient]::new($source.organizationName, $source.serviceHost, $source.patToken)
#     $destinationApiClient = [AzureDevOpsServicesAPIClient]::new($destination.organizationName, $destination.serviceHost, $destination.patToken)

#     Write-Output $sourceApiClient
#     Write-Output $destinationApiClient
#     # Export-BuildDefinitions -projectName 'NCDPP' -outputpath '.\temp\newBuildDefinitions' -apiClient $destinationApiClient -expand $true
#     # exit
#     Import-Repositories -sourceProjectName $source.projectName -sourceApiClient $sourceApiClient  -destinationProjectName $destination.projectName -destinationApiClient $destinationApiClient -destinationProjectId $destination.projectId
# }

function Move-Repositories {
    param (
        [switch] $showGitOutput
    )

    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()
    
    if (-Not (Test-Path $repositoriesToExcludeFilePath)) {
        throw "Required configuration file not found: $repositoriesToExcludeFilePath"
    }

    $repositoriesToExclude = (Get-Content -Path $repositoriesToExcludeFilePath) ?? @()

    $repositories = Get-Repositories -useTargetProject:$false

    $repositoriesToMove = @()

    foreach ($repository in $repositories) {
        if (-not ($repositoriesToExclude.Contains($repository.name))) {
            $repositoriesToMove += $repository
        }
        else {
            Write-Host "Repository $($repository.name) excluded."
        }
    }

    Copy-Repositories -useTargetProject:$true -showGitOutput:$showGitOutput -repositories $repositoriesToMove

    $stopwatch.Stop()
    write-host "$($repositoriesToMove.count) repositories migrated in $($stopwatch.Elapsed)"
}

function Move-Definitions {

    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()

    if (-Not (Test-Path $definitionsToExcludeFilePath)) {
        throw "Required configuration file not found: $definitionsToExcludeFilePath"
    }
    if (-Not (Test-Path $repositoriesToExcludeFilePath)) {
        throw "Required configuration file not found: $repositoriesToExcludeFilePath"
    }

    $definitionsToExclude = (Get-Content -Path $definitionsToExcludeFilePath) ?? @()
    $repositoriesToExclude = (Get-Content -Path $repositoriesToExcludeFilePath) ?? @()

    $definitions = (Get-Definitions -useTargetProject:$false) ?? @()
    $existingTargetDefinitions = (Get-Definitions -useTargetProject:$true | Select-Object -ExpandProperty name) ?? @()

    $definitionsToMove = @()
    $i = 0

    foreach ($definition in $definitions) {
        $progress = [math]::floor($i / $definitions.count * 100)

        Write-Progress -Activity "Getting definitions..." -Status "$progress% complete ($($definition.name))" -PercentComplete $progress
        $i++

        # Check if definition is excluded
        if ($definitionsToExclude.Contains($definition.name)) {
            Write-Host "Definition $($definition.name) excluded."
            continue
        }

        # Check if definition exist in target
        if ($existingTargetDefinitions.Contains($definition.name)) {
            Write-Host "Definition $($definition.name) excluded - the definition exists in the target project."
            continue
        }

        $definition = Get-Definition -useTargetProject:$false -id $definition.id

        # TODO: Remove this temporary check
        if ($definition.repository.name -eq 'web-view-client-api')
        {
            $definition.repository.name = 'view-client-api'
        }

        # Verify if the target repository is not excluded from migration.
        if ($repositoriesToExclude.Contains($definition.repository.name)) {
            Write-Host "Definition $($definition.name) excluded - the linked repository $($definition.repository.name) is excluded."
            continue
        }
            
        # Update the target repository for the definition
        $repository = Get-RepositoryByName -useTargetProject:$true -name $definition.repository.name

        $definition.repository.id = $repository.id

        $definitionsToMove += $definition
        
    }

    Write-Progress -Activity "Getting definitions..." -Completed
    
    Copy-Definitions -useTargetProject:$true -definitions $definitionsToMove

    $stopwatch.Stop()
    write-host "$($definitionsToMove.count) definitions migrated in $($stopwatch.Elapsed)"
}
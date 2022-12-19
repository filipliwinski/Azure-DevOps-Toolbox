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

function Get-RepositoriesToExclude {
    if (-Not (Test-Path $repositoriesToExcludeFilePath)) {
        throw "Required configuration file not found: $repositoriesToExcludeFilePath"
    }

    $repositoriesToExclude = (Get-Content -Path $repositoriesToExcludeFilePath) ?? @()

    return $repositoriesToExclude
}

function Get-DefinitionsToExclude {
    if (-Not (Test-Path $definitionsToExcludeFilePath)) {
        throw "Required configuration file not found: $definitionsToExcludeFilePath"
    }

    $definitionsToExclude = (Get-Content -Path $definitionsToExcludeFilePath) ?? @()

    return $definitionsToExclude
}

function Move-Repositories {
    param (
        [switch] $showGitOutput
    )

    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()
    
    $repositoriesToExclude = Get-RepositoriesToExclude

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
    Write-Host "$($repositoriesToMove.count) repositories migrated in $($stopwatch.Elapsed)"
}

function Move-PolicyConfigurations {

    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()
    $policiesMigratedCount = 0

    $repositoriesToExclude = Get-RepositoriesToExclude
    $definitionsToExclude = Get-DefinitionsToExclude

    $sourceRepositories = Get-Repositories -useTargetProject:$false
    $targetRepositories = Get-Repositories -useTargetProject:$true

    $sourceDefinitions = Get-Definitions -useTargetProject:$false
    $targetDefinitions = Get-Definitions -useTargetProject:$true

    $policies = Get-PolicyConfigurations -useTargetProject:$false

    # # Match policy types between projects (not really required...)
    # $sourcePolicyTypes = Get-PolicyTypes -useTargetProject:$false
    # $targetPolicyTypes = Get-PolicyTypes -useTargetProject:$true
    # $policyTypes = @{}

    # foreach ($sourcePolicyType in $sourcePolicyTypes) {
    #     $targetPolicyType = $targetPolicyTypes | Where-Object {$_.displayName -eq $sourcePolicyType.displayName}
    #     $policyTypes.add($sourcePolicyType.id, @{ 
    #         id = $targetPolicyType.id
    #         displayName = $targetPolicyType.displayName
    #     })
    # }

    # 001a79cf-fda1-4c4e-9e7c-bac40ee5ead8 Path Length restriction
    # 0517f88d-4ec5-4343-9d26-9930ebd53069 GitRepositorySettingsPolicyName
    # 0609b952-1397-4640-95ec-e00a01b2c241 Build
    # 2e26e725-8201-4edd-8bf5-978563c34a80 File size restriction
    # 40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e Work item linking
    # 51c78909-e838-41a2-9496-c647091e3c61 File name restriction
    # 77ed4bd3-b063-4689-934a-175e4d0a78d7 Commit author email validation
    # 7ed39669-655c-494e-b4a0-a08b4da0fcce Git repository settings
    # c6a1889d-b943-4856-b76f-9e46bb6b0df2 Comment requirements
    # cbdc66da-9728-4af8-aada-9a5a32e4a226 Status
    # db2b9b4c-180d-4529-9701-01541d19f36b Reserved names restriction
    # fa4e907d-c16b-4a4c-9dfa-4906e5d171dd Minimum number of reviewers
    # fa4e907d-c16b-4a4c-9dfa-4916e5d171ab Require a merge strategy
    # fd2167ab-b0be-447a-8ec8-39368250530e Required reviewers

    $i = 0
    foreach ($policy in $policies) {
        $i++
        if ($policy.type.id -ne '0609b952-1397-4640-95ec-e00a01b2c241' -and
            $policy.type.id -ne 'cbdc66da-9728-4af8-aada-9a5a32e4a226') {
            Write-Host "Policy $($policy.type.id) not supported."
            continue
        }

        if ($policy.settings.scope.count -gt 1) {
            throw "Scope contains multiple items."
        }

        $newSettings = $policy.settings

        # Match source and target repository
        $sourceRepository = $sourceRepositories | Where-Object { $_.id -eq $newSettings.scope[0].repositoryId }
        if ($null -eq $sourceRepository) {
            Write-Host "Repository with id $($newSettings.scope[0].repositoryId) does not exist."
            continue
        }

        # Check for excluded repositories
        if ($repositoriesToExclude.contains($sourceRepository.name)) {
            Write-Host "Repository $($sourceRepository.name) excluded (policy $($policy.type.id) for $($newSettings.scope[0].refName))."
            continue
        }
        if ($sourceRepository.name -eq 'web-view-client-api') {
            $sourceRepository.name = 'view-client-api'
        }

        Write-Host "Repository $($sourceRepository.name) (policy $($policy.type.id) for $($newSettings.scope[0].refName))"

        $progress = [math]::floor($i / $policies.count * 100)
        Write-Progress -Activity "Moving policies..." -Status "$progress% complete ($($sourceRepository.name))" -PercentComplete $progress

        $targetRepository = $targetRepositories | Where-Object { $_.name -eq $sourceRepository.name }

        $newSettings.scope[0].repositoryId = $targetRepository.id

        # Match build definitions
        if ($policy.type.id -eq '0609b952-1397-4640-95ec-e00a01b2c241') {
            $sourceDefinition = $sourceDefinitions | Where-Object { $_.id -eq $newSettings.BuildDefinitionId }
            if ($null -eq $sourceDefinition) {
                Write-Host "Definition with id $($newSettings.BuildDefinitionId) does not exist."
                continue
            }

            # Check if definition is excluded
            if ($null -ne $definitionsToExclude -and $definitionsToExclude.Contains($sourceDefinition.name)) {
                Write-Host "Definition $($sourceDefinition.name) excluded."
                continue
            }

            $targetDefinition = $targetDefinitions | Where-Object { $_.name -eq $sourceDefinition.name }

            $newSettings.BuildDefinitionId = $targetDefinition.id
        }

        $newPolicy = @{
            isEnabled = $policy.isEnabled
            isBlocking = $policy.isBlocking
            type = @{
                id = $policy.type.id
            }
            settings = $newSettings
        }

        New-PolicyConfiguration -useTargetProject:$true -policyConfiguration $newPolicy -configurationId $null
        $policiesMigratedCount++
    }

    Write-Progress -Activity "Moving policies..." -Completed

    $stopwatch.Stop()
    Write-Host "$($policiesMigratedCount) of $($policies.count) policies migrated in $($stopwatch.Elapsed)"
}

function Move-Definitions {

    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()

    $definitionsToExclude = Get-DefinitionsToExclude
    $repositoriesToExclude = Get-RepositoriesToExclude

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
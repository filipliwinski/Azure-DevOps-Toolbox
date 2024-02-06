# Copyright (c) Filip Liwiński
# Licensed under the MIT License. See the LICENSE file in the project root for license information.

. .\..\git\Repositories.ps1
. .\..\BuildDefinitions.ps1

$repositoriesToIncludeFilePath = '.\local_config\Migration\repositoriesToInclude.txt'
$repositoriesToExcludeFilePath = '.\local_config\Migration\repositoriesToExclude.txt'
$definitionsToExcludeFilePath = '.\local_config\Migration\definitionsToExclude.txt'

$buildPolicyId = '0609b952-1397-4640-95ec-e00a01b2c241'                             # This policy will require a successful build has been performed before updating protected refs.
$commentRequirementsPolicyId = 'c6a1889d-b943-4856-b76f-9e46bb6b0df2'               # Check if the pull request has any active comments.
$commitAuthorEmailValidationPolicyId = '77ed4bd3-b063-4689-934a-175e4d0a78d7'       # This policy will block pushes from including commits where the author email does not match the specified patterns.
$fileNameRestrictionPolicyId = '51c78909-e838-41a2-9496-c647091e3c61'               # This policy will reject pushes to a repository which add file paths that match the specified patterns.
$fileSizeRestrictionPolicyId = '2e26e725-8201-4edd-8bf5-978563c34a80'               # This policy will reject pushes to a repository for files which exceed the specified size.
$gitRepositorySettingsPolicyId = '7ed39669-655c-494e-b4a0-a08b4da0fcce'             # Git repository settings.
$gitRepositorySettingsPolicyNamePolicyId = '0517f88d-4ec5-4343-9d26-9930ebd53069'   # GitRepositorySettingsPolicyName
$minimumNumberOfReviewersPolicyId = 'fa4e907d-c16b-4a4c-9dfa-4906e5d171dd'          # This policy will ensure that a minimum number of reviewers have approved a pull request before completion.
$pathLengthRestrictionPolicyId = '001a79cf-fda1-4c4e-9e7c-bac40ee5ead8'             # This policy will reject pushes to a repository for paths which exceed the specified length.
$requireAMergeStrategyPolicyId = 'fa4e907d-c16b-4a4c-9dfa-4916e5d171ab'             # This policy ensures that pull requests use a consistent merge strategy.
$requiredReviewersPolicyId = 'fd2167ab-b0be-447a-8ec8-39368250530e'                 # This policy will ensure that required reviewers are added for modified files matching specified patterns.
$reservedNamesRestrictionPolicyId = 'db2b9b4c-180d-4529-9701-01541d19f36b'          # This policy will reject pushes to a repository for names which aren't valid on all supported client OSes.
$statusPolicyId = 'cbdc66da-9728-4af8-aada-9a5a32e4a226'                            # This policy will require a successfull status to be posted before updating protected refs.
$workItemLinkingPolicyId = '40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e'                   # This policy encourages developers to link commits to work items.

function Get-RepositoriesToInclude {
    if (-Not (Test-Path $repositoriesToIncludeFilePath)) {
        throw "Required configuration file not found: $repositoriesToIncludeFilePath"
    }

    $repositoriesToInclude = (Get-Content -Path $repositoriesToIncludeFilePath) ?? @()

    return $repositoriesToInclude
}

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

    $repositoriesToInclude = Get-RepositoriesToInclude
    $repositoriesToExclude = Get-RepositoriesToExclude

    $repositories = Get-Repositories -useTargetProject:$false

    # Verify the existance of repositories to include
    $missingRepositoriesToInclude = $repositoriesToInclude | Where-Object { $_ -notin $repositories.name }

    if ($missingRepositoriesToInclude.count -ne 0) {
        Write-Error "The repositoriesToInclude list contains items that do not exist:"
        $missingRepositoriesToInclude
        exit 1
    }

    # Verify the existance of repositories to exclude
    $missingRepositoriesToExclude = $repositoriesToExclude | Where-Object { $_ -notin $repositories.name }

    if ($missingRepositoriesToExclude.count -ne 0) {
        Write-Error "The repositoriesToExclude list contains items that do not exist:"
        $missingRepositoriesToExclude
        exit 1
    }

    # Include repositories from the config file
    $existingRepositoriesToInclude = @()

    if ($repositoriesToInclude.count -eq 0) {
        $existingRepositoriesToInclude = $repositories
    }
    else {
        $existingRepositoriesToInclude = $repositories | Where-Object { $repositoriesToInclude -contains $_.name }
    }

    # Exclude repositories from the config file
    $repositoriesToMove = @()

    if ($repositoriesToExclude.count -eq 0)
    {
        $repositoriesToMove = $existingRepositoriesToInclude
    }
    else {
        foreach ($repository in $existingRepositoriesToInclude) {
            if ($repositoriesToExclude.Contains($repository.name)) {
                Write-Host "Repository $($repository.name) excluded."
            }
            else {
                $repositoriesToMove += $repository
            }
        }
    }

    if ($repositoriesToMove.count -eq 0) {
        Write-Host "No repositories to copy."
    }
    else {
        Write-Host "Repositories to copy ($($repositoriesToMove.count) in total):"
        $repositoriesToMove | ForEach-Object { Write-Host $_.name }

        $stopwatch =  [system.diagnostics.stopwatch]::StartNew()

        Copy-Repositories -useTargetProject:$true -showGitOutput:$showGitOutput -repositories $repositoriesToMove

        $stopwatch.Stop()

        Write-Host "$($repositoriesToMove.count) repositories migrated in $($stopwatch.Elapsed)"
    }
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

    $i = 0
    foreach ($policy in $policies) {
        $i++
        if ($policy.type.id -ne $buildPolicyId -and
            $policy.type.id -ne $statusPolicyId) {
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

        Write-Host "Repository $($sourceRepository.name) (policy $($policy.type.id) for $($newSettings.scope[0].refName))"

        $progress = [math]::floor($i / $policies.count * 100)
        Write-Progress -Activity "Moving policies..." -Status "$progress% complete ($($sourceRepository.name))" -PercentComplete $progress

        $targetRepository = $targetRepositories | Where-Object { $_.name -eq $sourceRepository.name }

        $newSettings.scope[0].repositoryId = $targetRepository.id

        # Match build definitions
        if ($policy.type.id -eq $buildPolicyId) {
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
        if ($null -ne $definitionsToExclude -and $definitionsToExclude.Contains($definition.name)) {
            Write-Host "Definition $($definition.name) excluded."
            continue
        }

        # Check if definition exist in target
        if ($null -ne $existingTargetDefinitions -and $existingTargetDefinitions.Contains($definition.name)) {
            Write-Host "Definition $($definition.name) excluded - the definition exists in the target project."
            continue
        }

        $definition = Get-Definition -useTargetProject:$false -id $definition.id

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

Export-ModuleMember -Function Move-*

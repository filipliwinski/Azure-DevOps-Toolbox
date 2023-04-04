# Azure DevOps Toolbox 🧰

Azure DevOps Toolbox is a set of PowerShell scripts that helps you manage your Azure DevOps projects. It uses the Azure DevOps REST API and allows to read, write and manage data stored in Azure DevOps as well as export and import them with a few commands.

The API specification can be found [here](https://github.com/MicrosoftDocs/vsts-rest-api-specs).

⚠ This project is in an early stage of development. Until now it has only been partially tested with Azure DevOps Server API v.6.0.

## Requirements

- PowerShell 7+
- Git
- Visual Studio Code with the PowerShell extension (recommended)

## How to use

1. Clone the repository to your machine.
2. Open a PowerShell terminal window in the location of the cloned repository.
3. In the terminal window go into the `src\` folder:

    `cd src`

4. Generate ApiClient modules by running the ApiClientGenerator script:

    `.\ApiClientGenerator.ps1`

5. Wait until the API Clients are generated. Once they are ready, configure the `demo.ps1` script with your target API version. Just include one of the `.ps1` files from the `ApiClients` folder in line 24 of `demo.ps1`.
6. Configure the `demo.ps1` script with your organization name, project name and PAT token.
7. Now you can include other `.ps1` scripts from the `src/` folder and start managing your Azure DevOps project like a pro. Just be aware that there is no prompt before deleting things (and no Undo button or `dryRun` flag). Be careful when using `Remove-` commands! Run the demo script to see Azure DevOps Toolbox in action:

    `.\demo.ps1`

## Notes for developers

If you make changes to any PowerShell modules (.psm1 files) you must close and reopen your PS terminal each time. Otherwise PowerShell won't reload modules but will continue to use the old versions.

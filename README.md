# Azure DevOps Toolbox 🧰

Azure DevOps Toolbox is a set of PowerShell scripts that helps you manage your Azure DevOps projects. It uses the Azure DevOps REST API and allows to read, write and manage data stored in Azure DevOps as well as export and import them with a few commands.

The API specification can be found [here](https://github.com/MicrosoftDocs/vsts-rest-api-specs).

⚠ This project is in an early stage of development.

## Requirements

- PowerShell 7+
- Git
- Visual Studio Code with the PowerShell extension (recommended)

## Notes for developers

If you make changes to any PowerShell modules (.psm1 files) you must close and reopen your PS terminal each time. Otherwise PowerShell won't reload modules but will continue to use the old versions.

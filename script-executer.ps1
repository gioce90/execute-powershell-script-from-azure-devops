##########################################################################
## 'ScriptExecuter' script v1.0
## This functions will execute a powershell script saved on a repository.
##
## developed by Gioacchino Piazzolla AKA Gioak AKA Gioce90
##########################################################################

# How it works
# To works you need to pass some input parameters as:
# - Organization, project and repo names.
# - The path of your script in the repository.
# - A PAT (Personal Access Token) with 'Code' read rights.

# Example
# An example of call is in call-my-script.ps1: you can edit or duplicate this file

function ScriptExecuter {
    param (
        [cmdletbinding()]
        [parameter()][string]$organization, # Organization name
        [parameter()][string]$project,      # Project name
        [parameter()][string]$repository,   # Repository name
        [parameter()][string]$scriptPath,   # Path of your script
        [parameter()][string]$pat           # Personal Access Token
    )

    Write-Host 'Get a script from Azure DevOps and execute it'

    $options = "&recursionLevel=0&includeContentMetadata=true&versionDescriptor.version=main&versionDescriptor.versionOptions=0&versionDescriptor.versionType=0&includeContent=true&resolveLfs=true"
    $url = "https://dev.azure.com/${organization}/${project}/_apis/git/repositories/${repository}/Items?path=${scriptPath}${options}"
    $B64Pat = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("`:$pat"))
    $json = Invoke-Webrequest -Uri $url -Headers @{'Authorization' = 'Basic ' + $B64Pat; 'Accept' = 'application/json' }
    $codeContent = ($json.Content | ConvertFrom-Json).content

    Invoke-Expression $codeContent
}
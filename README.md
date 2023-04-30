# Execute powershell script from Azure DevOps
A way to quickly call and execute a remote powershell script saved on a Azure DevOps repository.



## Scope
Sometimes happens that you have Powershell scripts shared with your work team on an Azure DevOps repository. Scripts that can be updated frequently. It can be useful to run the latest updated version, without constantly checking and downloading. With this script you configure it once and you'll be able to run the latest version forever. Simple :)

## How it works

A ScriptExecuter function will call and execute your PowerShell script saved on a repository. You just need to set where your script is and how to access it.

In this repo you will find two files:
- *script-executer.ps1* file: who contains the ScriptExecuter function. You can inspect it, but you don't need to edit this file.
- *call-my-script.ps1* file: who calls the ScriptExecuter function. You need to edit this file with these data: 
    - Organization, project and repo names.
    - The path of your script in the repository.
    - A PAT (Personal Access Token) with 'Code' read rights.

## Advices
- My first advice is to duplicate the file *call-my-script.ps1* and rename it in call-[name-of-your-script].ps1, for each one of your scripts.
- Never check-in on a repository your secret PAT. However if this happens, immediately invalidate it from Azure DevOps User settings and then delete the old invalid PAT from your code.
- In your Azure DevOps repository, my advice is to use this scaffolding: /myScriptFolder/v1/myScript.ps1. In this way you can versioning your scripts. In the myScriptFolder folder you can put a .MD file who explain how the script works.

## Developed by
Gioacchino Piazzolla AKA Gioak AKA Gioce90

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


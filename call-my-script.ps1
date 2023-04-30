##########################################################################
## 'CALL-MY-SCRIPT' template script v1.0
## This script calls the ScriptExecuter function declared 
## in script-executer.ps1 file. To know how it works, look in there.
##
## developed by Gioacchino Piazzolla AKA Gioak AKA Gioce90
##########################################################################

# Advices:
# - Duplicate call-my-scripts.ps1: my advice is to duplicate this file and 
# rename in call-[nameOfYourScript].ps1, for each of your scripts.
# - Never check-in on a repository your secret PAT.

# Put your input parameters here:
$organization = "your-azure-devops-organization-name"
$project = "project-name"
$repository = "repository-name"
$scriptPath = "/path/to/your/script"    # for example /myFolder/v1/myScript.ps1
$pat = 'YOUR_SECRET_PAT_GOES_HERE'

. .\script-executer.ps1

ScriptExecuter `
-organization $organization `
-project $project `
-repository $repository `
-scriptPath $scriptPath `
-pat $pat
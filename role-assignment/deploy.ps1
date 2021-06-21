#The role assignment for RSV managed identity is deployd by passing parameters from the powershell script to the arm template.
# No use of a parameters file
# The scope is defined from the level of deployment. In this script the scope is a resourcegroup.
#https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-template
param ($environment)
$resourcegroup ="$environment-rg"
$timestamp=$(Get-Date -Format "yyyyMMdd-HHmmss")
$deploymentname= "role-assignment-$environment-$timestamp"
Start-Sleep -s 30 # waiting for the $objectID of the recovery service vault(previos deployment) to be created by Azure...tik tak tik tak...
$objectid = (Get-AzADServicePrincipal -DisplayName hub-rsv-$environment).id # getting the objectID of the Recovery Service Vault deployed.
$builtInRoleType = "Contributor"
az deployment group create --resource-group $resourcegroup --name $deploymentname --template-file template.json --parameters principalId=$objectid builtInRoleType=$builtInRoleType
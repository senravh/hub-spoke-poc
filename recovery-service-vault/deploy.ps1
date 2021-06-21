#Creates the recovery service vault needed for this deployment
param ($environment)
$resourcegroup ="$environment-rg"
$timestamp=$(Get-Date -Format "yyyyMMdd-HHmmss")
$deploymentname= "RecoveryServiceVault-$environment-$timestamp"
az deployment group create --resource-group $resourcegroup --name $deploymentname --template-file template.json --parameters @parameters-$environment.json -o table
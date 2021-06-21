#Creates the vnet`s needed for this deployment. 
param ($environment)
$resourcegroup ="$environment-rg"
$timestamp=$(Get-Date -Format "yyyyMMdd-HHmmss")
$hubdeploymentname= "hub-vnet-$environment-$timestamp"
$spokedeploymentname= "spoke-vnet-$environment-$timestamp"
az deployment group create --resource-group $resourcegroup --name $hubdeploymentname --template-file template.json --parameters @parameters-$environment-"hub".json -o table
az deployment group create --resource-group $resourcegroup --name $spokedeploymentname --template-file template.json --parameters @parameters-$environment-"spoke".json -o table

#Creates the resource group needed for this deployment. $deploymentname makes this deployment unique and easy to track in the Azure deployment logs
param ($environment, $location)
$timestamp=$(Get-Date -Format "yyyyMMdd-HHmmss")
$deploymentname= "rg-$environment-$timestamp"
az deployment sub create --location $location --name $deploymentname --template-file template.json --parameters @parameters-$environment.json --parameters location=$location

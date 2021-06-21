#Creates the dns private network link needed for this deployment
param ($environment)
$resourcegroup ="$environment-rg"
$timestamp=$(Get-Date -Format "yyyyMMdd-HHmmss")
$deploymentname= "DnsPrivateZoneNetworkLink-$environment-$timestamp"
az deployment group create --resource-group $resourcegroup --name $deploymentname --template-file template.json --parameters @parameters-$environment.json -o table

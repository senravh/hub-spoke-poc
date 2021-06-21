param ($environment)
$resourcegroup ="$environment-rg"
$timestamp=$(Get-Date -Format "yyyyMMdd-HHmmss")
$deploymentname= "vnet-$environment-$timestamp"
az deployment group validate --resource-group $resourcegroup --template-file template.json --parameters @parameters-$environment.json -o table
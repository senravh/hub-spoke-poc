#Verify arm template
param ($environment)
$resourcegroup ="$environment-rg"
az deployment group validate --resource-group $resourcegroup --template-file template.json --parameters @parameters-$environment-"hub".json -o table
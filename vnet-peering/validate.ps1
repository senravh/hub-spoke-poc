param ($environment)
$resourcegroup ="$environment-rg"

az deployment group validate --resource-group $resourcegroup --template-file template.json --parameters @parameters-$environment.json -o table
#validate arm template
param ($environment)
if ($environment -eq "blue")
{
$location = "northeurope"   
}
else 
{
$location = "westeurope"   
}
az deployment sub validate --location $location --template-file template.json --parameters @parameters-$environment.json -o table



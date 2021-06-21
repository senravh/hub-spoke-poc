param ($environment,$location)
Set-Location .\resource-group
.\deploy.ps1 $environment $location
Set-Location ..\nsg
.\deploy.ps1 $environment
Set-Location ..\vnet
.\deploy.ps1 $environment
Set-Location ..\vnet-peering
.\deploy.ps1 $environment
Set-Location ..\dns-private-zone
.\deploy.ps1 $environment
Set-Location ..\dns-private-network-link
.\deploy.ps1 $environment
Set-Location ..\recovery-service-vault
.\deploy.ps1 $environment
Set-Location ..\role-assignment
.\deploy.ps1 $environment
Set-Location ..\private-endpoints
.\deploy.ps1 $environment
Set-Location ..\bastion
.\deploy.ps1 $environment
cd..
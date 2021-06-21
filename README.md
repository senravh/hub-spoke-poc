# hub&spoke-poc
Hub&spoke Proof of consept with blue/green deployment. Everything deployed in one resource group (easy to clean up/delete deployment)

![Hub spokePOC](https://user-images.githubusercontent.com/16702714/122814569-b0709500-d2d4-11eb-95ac-eacde70769e2.png)


### How to deploy this design
* Tested and deployd from Visual studio code. 
* Run deploy.ps1 from the root of the repository with $environment parameter blue/green and $location parameter northeurope/westeurope. The master deploy.ps1 will kick of the rest of the deployment.

![deploy](https://user-images.githubusercontent.com/16702714/122814554-a9e21d80-d2d4-11eb-951f-8a4a77f0a511.PNG)


### What is actually deployed here
* Vnets with a hub&spoke design. 
* Subnets segmented to some of (but not limited to) the most common services you would deploy in a hub&spoke design.
* Network security groups deployd to subnets (that can have NSG`s) with a rule to allow RDP and SSH from the Bastion subnet. 
* Vnet peering between the hub and spoke vnet to allow network connectivity between them.
* Recovery services vault (RSV) with privat endpoint deployd to a management subnet.
    * private endpoint is created for the backup service of the recovery services vault.
    * Recovery services vault is created with a managed identity which is assigned the contributor role at the resource group scope level
    * A role assignment to allow the Recovery service vault to be represented as a private endpoint in the management subnet
* Dns private zone for the RSV backup service. 
    * Private network links enabled for the vnets in the Dns private zone 
    * That way name resolution to the RSV private endpoint is possible for services/servers deployed in the vnets. (you still need to manually or automate the creation of the RSV
    * private endpoint A records in the DNS private zone) 
* Bastion for secure access and management

### Naming convention
$environment parameter is used as part of resource name

|                              |                                                                    |
| :--------------------------- | :----------------------------------------------------------------- |
| $environment                 | Blue or green                                                      |
| $location                    | Northeurope or westeurope
| arm template                 | template.json                                                      |
| Arm template parameters file | Parameters.json                                                    |
| Validation script            | Validate.ps1                                                       |
| Deployment script            | Deploy.ps1                                                         |
| Deployment name              | "type"-$environment--yyyyMMdd-hhmmss  Eks: rg-blue-yyyyMMdd-hhmmss |
|                              |                                                                    |


### design choices
Splitting the deployment up in a folder structure makes the arm templates small and fairly easy to read. Master deploy script calls all other scripts to deploy resources.
As the deployment grows and gets more complex one could use linked ARM templates, bicep or go for Terraform

### Cost
The biggest cost of this deployment is the Bastion service. Remember to clean up/delete the resource group and all the services deployed when testing is done. 
* Azure Bastion: price per hour + outbound data transfer per month (when the free 5 GB is used up)
* Public Ip: price per hour
* Private endpoint: Price per. hour + per GB inbound & outbound data transfer
* Private DNS: Price per zone per month + per million queries
* Vnet peering: Price per GB inbound & outbound data transfer when vnet is in same region
* backup: price pr. instance (f.eks a virtual server) size + storage consumed by instance.

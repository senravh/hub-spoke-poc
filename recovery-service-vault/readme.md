
Prerequisites

1. Enable managed identity for the recovery service vault
    There is litle information about doing this in an arm template. Finaly I stubled on this article that addresses the issue:
    https://www.codeisahighway.com/there-is-a-new-way-to-reference-managed-identity-in-arm-template/
    also some hint in this article: 
    https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/qs-configure-template-windows-vmss

2. Give the RSV managed identity correct permission to create the private endpoint
    The Resource Group that contains the target VNet
    The Resource Group where the Private Endpoints are to be created
    The Resource Group that contains the Private DNS zones
    We recommend that you grant the Contributor role for those three resource groups to the vault (managed identity).
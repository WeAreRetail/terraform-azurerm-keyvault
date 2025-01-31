# Azure  Key Vault

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_keyvault?repoName=mod_azu_keyvault&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=11&repoName=mod_azu_keyvault&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)


Common Azure terraform module to create an Azure KeyVault

## Naming
Resource naming is based on the Microsoft CAF naming convention best practices. Custom naming is available by setting the parameter `custom_name`. We rely on the official Terraform Azure CAF naming provider to generate resource names when available.

## Security 
We use the new RBAC model. See [https://docs.microsoft.com/fr-fr/azure/key-vault/general/rbac-guide?tabs=azure-cli] (https://docs.microsoft.com/fr-fr/azure/key-vault/general/rbac-guide?tabs=azure-cli) for more information.

Support for access strategies is reserved for legacy projects.

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.16 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.2 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_index"></a> [instance\_index](#input\_instance\_index) | Resource type index on the resource group. | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the parent resource group name. | `string` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_custom_location"></a> [custom\_location](#input\_custom\_location) | Specifies a custom location for the resource. | `string` | `""` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Specifies a custom name for the resource. | `string` | `""` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | The custom tags to add on the resource. | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Resource group description. | `string` | `""` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Enable RBAC authorization for the specified vault. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | `bool` | `false` | no |
| <a name="input_name_separator"></a> [name\_separator](#input\_name\_separator) | Separator for CAF prefixes in name. | `string` | `"-"` | no |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | Defines the network ACLs rules. See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#bypass for more informations. | <pre>object({<br/>    bypass                     = string,<br/>    default_action             = string,<br/>    ip_rules                   = list(string),<br/>    virtual_network_subnet_ids = list(string),<br/>  })</pre> | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The Name of the SKU used for this Key Vault. Possible values are "standard" and "premium". | `string` | `"standard"` | no |
| <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled) | Whether to activate delete protection | `bool` | `true` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Soft delete retention days | `number` | `7` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription Id. | `string` | `""` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one. | `string` | `""` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | Id of the Key Vault |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | Name of the Key Vault |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | Uri of the Key Vault |
<!-- END_TF_DOCS -->

## Related documentation

Terraform Azure public IP documentation: [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/keyvault)

Terraform Azure CAF Naming documentation: [https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name)


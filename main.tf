
locals {
  specific_tags = {
    "description" = var.description
  }

  location      = coalesce(var.custom_location, data.azurerm_resource_group.parent_group.location)
  parent_tags   = { for n, v in data.azurerm_resource_group.parent_group.tags : n => v if n != "description" }
  resource_name = coalesce(var.custom_name, azurecaf_name.self.result)
  tags          = { for n, v in merge(local.parent_tags, local.specific_tags, var.custom_tags) : n => v if v != "" }

  subscription_id = coalesce(var.subscription_id, data.azurerm_client_config.current.subscription_id)
  tenant_id       = coalesce(var.tenant_id, data.azurerm_client_config.current.tenant_id)
}

data "azurerm_resource_group" "parent_group" {
  name = var.resource_group_name
}

data "azurerm_client_config" "current" {
}

resource "azurecaf_name" "self" {
  name          = format("%02d", var.instance_index)
  resource_type = "azurerm_key_vault"
  prefixes      = var.caf_prefixes
  suffixes      = []
  use_slug      = true
  clean_input   = true
  separator     = var.name_separator
  random_length = 5
}

resource "azurerm_key_vault" "self" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = data.azurerm_resource_group.parent_group.name
  tags                = local.tags

  tenant_id                       = local.tenant_id
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  purge_protection_enabled        = var.soft_delete_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  enable_rbac_authorization       = var.enable_rbac_authorization

  dynamic "network_acls" {
    for_each = var.network_acls == null ? [] : [var.network_acls]
    iterator = rule

    content {
      bypass                     = coalesce(rule.value.bypass, "None")
      default_action             = coalesce(rule.value.default_action, "Deny")
      virtual_network_subnet_ids = rule.value.virtual_network_subnet_ids
      ip_rules                   = rule.value.ip_rules
    }
  }
}

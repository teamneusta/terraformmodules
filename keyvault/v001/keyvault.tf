resource "azurerm_key_vault" "key_vault" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                        = var.key_vault_sku
  soft_delete_enabled             = var.soft_delete_enabled
  purge_protection_enabled        = var.purge_protection_enabled
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = true
  enabled_for_template_deployment = true

  network_acls {
    default_action             = var.allow_public_access ? "Allow" : "Deny"
    bypass                     = var.allow_azure_access ? "AzureServices" : "None"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.vnet_rule_subnets.*.id
  }
}
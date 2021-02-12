resource "azurerm_recovery_services_vault" "vault" {
  name                = local.resource_name
  resource_group_name = local.resource_group_name
  location            = local.location

  sku                 = var.vault_sku
  soft_delete_enabled = var.soft_delete_enabled

  tags = var.tags
}

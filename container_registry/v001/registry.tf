resource "azurerm_container_registry" "acr" {
  name                = local.resource_name
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = var.registry_sku
  admin_enabled       = var.registry_admin_enabled
}

resource "azurerm_virtual_network" "default" {
  name                = local.resource_name
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}

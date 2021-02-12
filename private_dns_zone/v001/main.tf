resource "azurerm_private_dns_zone" "default" {
  name                = var.private_dns_zone_name
  resource_group_name = local.resource_group_name
}

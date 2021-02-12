resource "azurerm_dns_zone" "default" {
  name                = var.dns_zone_name
  resource_group_name = local.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  for_each = {
    for x in var.virtual_networks :
    x.name => x.id
  }

  name                  = each.key
  resource_group_name   = local.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = each.value
}

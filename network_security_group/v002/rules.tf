# Simple rules to open TCP ports from a specified address prefix list
resource "azurerm_network_security_rule" "rules" {
  for_each = {
    for x in var.rules :
    x.name => x
  }

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                         = each.key
  priority                     = each.value.priority
  direction                    = coalesce(each.value.direction, "Inbound")
  access                       = coalesce(each.value.access, "Allow")
  protocol                     = coalesce(each.value.protocol, "TCP")
  source_port_range            = length(each.value.source_port_ranges) == 0 ? "*" : null
  source_port_ranges           = length(each.value.source_port_ranges) == 0 ? null : each.value.source_port_ranges
  destination_port_range       = length(each.value.destination_port_ranges) == 0 ? "*" : null
  destination_port_ranges      = length(each.value.destination_port_ranges) == 0 ? null : each.value.destination_port_ranges
  source_address_prefix        = length(each.value.source_address_prefixes) == 0 ? "*" : null
  source_address_prefixes      = length(each.value.source_address_prefixes) == 0 ? null : each.value.source_address_prefixes
  destination_address_prefix   = length(each.value.destination_address_prefixes) == 0 ? "*" : null
  destination_address_prefixes = length(each.value.destination_address_prefixes) == 0 ? null : each.value.destination_address_prefixes
}

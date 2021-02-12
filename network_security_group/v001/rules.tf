# Simple rules to open TCP ports
resource "azurerm_network_security_rule" "nsg_open_ports" {
  for_each = {
    for x in var.nsg_open_ports :
    x.name => x
  }

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = each.key
  priority                   = 1000 + index(var.nsg_open_ports.*.name, each.key)
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = each.value.port_range
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

# Simple rules to open TCP ports from a specified address prefix list
resource "azurerm_network_security_rule" "nsg_restricted_ports" {
  for_each = {
    for x in var.nsg_restricted_ports :
    x.name => x
  }

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = each.key
  priority                   = 2000 + index(var.nsg_restricted_ports.*.name, each.key)
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = each.value.port_range
  source_address_prefixes    = each.value.address_prefixes
  destination_address_prefix = "*"
}

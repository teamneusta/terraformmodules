# Simple rules to open TCP ports
resource "azurerm_network_security_rule" "open_ports" {
  for_each = {
    for x in var.open_ports :
    x.name => x
  }

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = each.key
  priority                   = 1000 + index(var.open_ports.*.name, each.key)
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "TCP"
  source_port_range          = "*"
  destination_port_range     = each.value.port_range
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

# Create Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name
}

# Deny Virtual Network Inbound
resource "azurerm_network_security_rule" "deny_vnet_inbound" {
  count = var.deny_vnet_inbound ? 1 : 0

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "DenyVnetInBound"
  priority                   = 4096
  direction                  = "Inbound"
  access                     = "Deny"
  protocol                   = "*"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

# Deny Virtual Network Outbound
resource "azurerm_network_security_rule" "deny_vnet_outbound" {
  count = var.deny_vnet_outbound ? 1 : 0

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "DenyVnetOutBound"
  priority                   = 4095
  direction                  = "Outbound"
  access                     = "Deny"
  protocol                   = "*"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

# Deny Internet Outbound
resource "azurerm_network_security_rule" "deny_internet_outbound" {
  count = var.deny_internet_outbound ? 1 : 0

  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "DenyInternetOutBound"
  priority                   = 4096
  direction                  = "Outbound"
  access                     = "Deny"
  protocol                   = "*"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "*"
  destination_address_prefix = "Internet"
}

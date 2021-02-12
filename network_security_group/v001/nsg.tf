# Create Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name
}

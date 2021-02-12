# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    primary                       = true
    name                          = var.configuration_name
    subnet_id                     = var.subnet.id
    private_ip_address_allocation = var.private_ip_address != null ? "Static" : "Dynamic"
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.public_ip != null ? var.public_ip.id : null
  }
}

# Assign network security group to network interface
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.network_security_group.id
}

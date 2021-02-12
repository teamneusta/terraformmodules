resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = var.subnet.id
  network_security_group_id = var.network_security_group.id
}

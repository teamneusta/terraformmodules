output "result" {
  value = azurerm_network_interface.nic
}

output "id" {
  value = azurerm_network_interface.nic.id
}

output "data" {
  value = {
    id                 = azurerm_network_interface.nic.id
    configuration_name = var.configuration_name
  }
}

output "result" {
  value = azurerm_network_security_group.nsg
}

output "id" {
  value = azurerm_network_security_group.nsg.id
}

output "data" {
  value = {
    id                  = azurerm_network_security_group.nsg.id
    name                = azurerm_network_security_group.nsg.name
    resource_group_name = azurerm_network_security_group.nsg.resource_group_name
  }
}

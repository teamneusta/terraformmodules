output "result" {
  description = "The virtual network resource"
  value       = azurerm_virtual_network.default
}

output "id" {
  description = "The resource ID of the network as string"
  value       = azurerm_virtual_network.default.id
}

output "virtual_network" {
  description = "The virtual network data"
  value = {
    id                  = azurerm_virtual_network.default.id
    name                = azurerm_virtual_network.default.name
    resource_group_name = azurerm_virtual_network.default.resource_group_name
  }
}

output "data" {
  description = "The names and IDs of the subnets."
  value = {
    for sbn in azurerm_subnet.default :
    substr(sbn.name, local.subnet_name_prefix_length, 256) => {
      name               = sbn.name
      id                 = sbn.id
      address_prefix     = sbn.address_prefix
      service_endpoints  = sbn.service_endpoints
      virtual_network_id = azurerm_virtual_network.default.id
    }
  }
}

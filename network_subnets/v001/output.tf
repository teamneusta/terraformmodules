output "virtual_network" {
  description = "The virtual network data"
  value       = var.virtual_network
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
      virtual_network_id = var.virtual_network.id
    }
  }
}

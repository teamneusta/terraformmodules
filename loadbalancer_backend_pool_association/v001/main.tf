resource "azurerm_network_interface_backend_address_pool_association" "default" {
  for_each = {
    for x in [var.backend_pool.name] :
    x => x
  }

  network_interface_id    = var.nic.id
  ip_configuration_name   = var.nic.configuration_name
  backend_address_pool_id = var.backend_pool.id
}
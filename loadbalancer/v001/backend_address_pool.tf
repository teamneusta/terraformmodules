resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = {
    for x in var.backend_pools :
    x.name => x
  }

  resource_group_name = local.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "${each.key}_BackendPool"
}

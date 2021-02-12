resource "azurerm_lb_outbound_rule" "outbound_rule" {
  for_each = {
    for x in var.backend_pools :
    x.name => x if x.enable_outbound_rule
  }

  resource_group_name     = local.resource_group_name
  loadbalancer_id         = azurerm_lb.lb.id
  name                    = "${each.key}_OutboundRule"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool[each.key].id

  frontend_ip_configuration {
    name = "default"
  }
}

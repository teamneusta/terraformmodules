resource "azurerm_lb_rule" "rule" {
  for_each = {
    for x in var.rules :
    x.name => x
  }

  resource_group_name = var.loadbalancer.resource_group_name
  loadbalancer_id     = var.loadbalancer.id

  name                           = "${each.key}_Rule"
  protocol                       = coalesce(each.value.protocol, "All")
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  backend_address_pool_id        = var.backend_pools[each.value.backend_pool_name].id
  frontend_ip_configuration_name = each.value.configuration_name
  load_distribution              = each.value.load_distribution
  probe_id                       = each.value.probe_name != "" ? var.probes[each.value.probe_name].id : ""
}

resource "azurerm_lb_nat_rule" "nat_rule" {
  for_each = {
    for x in var.nat_rules :
    x.name => x
  }

  resource_group_name = var.loadbalancer.resource_group_name
  loadbalancer_id     = var.loadbalancer.id

  name                           = "${each.key}_NatRule"
  protocol                       = coalesce(each.value.protocol, "All")
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  frontend_ip_configuration_name = "default"
}
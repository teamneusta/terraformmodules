# Probes for TCP/UDP protocol
resource "azurerm_lb_probe" "probe" {
  for_each = {
    for x in var.probes :
    x.name => x if lower(x.protocol) != "http"
  }

  resource_group_name = var.loadbalancer.resource_group_name
  loadbalancer_id     = var.loadbalancer.id

  name     = "${each.key}_Probe"
  protocol = coalesce(each.value.protocol, "All")
  port     = each.value.backend_port
}

# Probes for HTTP protcol
resource "azurerm_lb_probe" "probe_http" {
  for_each = {
    for x in var.probes :
    x.name => x if lower(x.protocol) == "http"
  }

  resource_group_name = var.loadbalancer.resource_group_name
  loadbalancer_id     = var.loadbalancer.id

  name         = "${each.key}_Probe"
  protocol     = "Http"
  port         = each.value.backend_port
  request_path = each.value.request_path
}

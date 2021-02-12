module "backend_pool_probes" {
  source = "../../loadbalancer_backend_pool_probes/v001"

  loadbalancer = azurerm_lb.lb
  probes       = var.probes
}

module "backend_pool_rules" {
  source = "../../loadbalancer_backend_pool_rules/v001"

  loadbalancer = azurerm_lb.lb
  rules        = var.rules

  backend_pools = {
    for pool in azurerm_lb_backend_address_pool.backend_pool :
    substr(pool.name, 0, length(pool.name) - 12) => {
      id = pool.id
    }
  }

  probes = module.backend_pool_probes.data
}

module "nat_rules" {
  source = "../../loadbalancer_nat_rules/v001"

  loadbalancer = azurerm_lb.lb
  nat_rules    = var.nat_rules
}
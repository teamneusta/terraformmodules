output "result" {
  description = "The load balancer resource"
  value       = azurerm_lb.lb
}

output "id" {
  description = "The resource ID of the load balancer"
  value       = azurerm_lb.lb.id
}

output "data" {
  value = {
    id                  = azurerm_lb.lb.id
    name                = azurerm_lb.lb.name
    resource_group_name = azurerm_lb.lb.resource_group_name
  }
}

output "backend_pools" {
  value = {
    for pool in azurerm_lb_backend_address_pool.backend_pool :
    substr(pool.name, 0, length(pool.name) - 12) => {
      id   = pool.id
      name = substr(pool.name, 0, length(pool.name) - 12)
    }
  }
}

output "probes" {
  value = module.backend_pool_probes.data
}

output "rules" {
  value = module.backend_pool_rules.data
}

output "nat_rules" {
  value = module.nat_rules.data
}
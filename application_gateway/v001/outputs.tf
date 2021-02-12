output "result" {
  description = "The application gateway resource"
  value       = azurerm_application_gateway.gateway
}

output "id" {
  description = "The resource ID of the application gateway"
  value       = azurerm_application_gateway.gateway.id
}

output "data" {
  value = {
    id                  = azurerm_application_gateway.gateway.id
    name                = azurerm_application_gateway.gateway.name
    resource_group_name = azurerm_application_gateway.gateway.resource_group_name
  }
}

output "backend_pools" {
  value = {
    for pool in azurerm_application_gateway.gateway.backend_address_pool :
    substr(pool.name, 0, length(pool.name) - 11) => {
      id   = pool.id
      name = substr(pool.name, 0, length(pool.name) - 11)
    }
  }
}

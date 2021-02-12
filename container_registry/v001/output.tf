output "result" {
  description = "The container registry resource"
  value       = azurerm_container_registry.acr
}

output "id" {
  description = "The resource ID of the container registry"
  value       = azurerm_container_registry.acr.id
}

output "data" {
  description = "The container registry data"
  value = {
    id   = azurerm_container_registry.acr.id
    name = azurerm_container_registry.acr.name
  }
}

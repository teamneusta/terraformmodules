output "result" {
  description = "The private DNS zone resource"
  value       = azurerm_private_dns_zone.default
}

output "id" {
  description = "The resource ID of the private DNS zone as string"
  value       = azurerm_private_dns_zone.default.id
}

output "data" {
  description = "The private DNS zone data"
  value = {
    id                  = azurerm_private_dns_zone.default.id
    name                = azurerm_private_dns_zone.default.name
    resource_group_name = azurerm_private_dns_zone.default.resource_group_name
  }
}

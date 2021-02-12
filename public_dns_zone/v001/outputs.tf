output "result" {
  description = "The DNS zone resource"
  value       = azurerm_dns_zone.default
}

output "id" {
  description = "The resource ID of the DNS zone as string"
  value       = azurerm_dns_zone.default.id
}

output "data" {
  description = "The DNS zone data"
  value = {
    id                  = azurerm_dns_zone.default.id
    name                = azurerm_dns_zone.default.name
    resource_group_name = azurerm_dns_zone.default.resource_group_name
  }
}

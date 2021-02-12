output "result" {
  description = "The public IP resource"
  value       = azurerm_public_ip.ip
}

output "id" {
  description = "The resource ID of the public IP"
  value       = azurerm_public_ip.ip.id
}

output "data" {
  value = {
    id         = azurerm_public_ip.ip.id
    ip_address = azurerm_public_ip.ip.ip_address
    fqdn       = azurerm_public_ip.ip.fqdn
  }
}

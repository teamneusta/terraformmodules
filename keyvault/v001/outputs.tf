output "result" {
  description = "The key vault resource"
  value       = azurerm_key_vault.key_vault
}

output "id" {
  description = "The resource ID of the key vault as string"
  value       = azurerm_key_vault.key_vault.id
}

output "data" {
  value = {
    id = azurerm_key_vault.key_vault.id
  }
}

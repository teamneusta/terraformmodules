output "result" {
  description = "The key vault secret resource"
  value       = azurerm_key_vault_secret.secret
}

output "id" {
  description = "The ID of the key vault secret"
  value       = azurerm_key_vault_secret.secret.id
}

output "data" {
  value = {
    id = azurerm_key_vault_secret.secret.id
  }
}


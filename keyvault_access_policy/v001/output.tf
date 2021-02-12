output "result" {
  description = "The key vault access policy resource"
  value       = azurerm_key_vault_access_policy.policy
}

output "id" {
  description = "The resource ID of the key vault access policy"
  value       = azurerm_key_vault_access_policy.policy.id
}

output "data" {
  value = {
    id = azurerm_key_vault_access_policy.policy.id
  }
}
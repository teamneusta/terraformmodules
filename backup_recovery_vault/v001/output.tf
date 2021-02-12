output "result" {
  description = "The vault resource"
  value       = azurerm_recovery_services_vault.vault
}

output "id" {
  description = "The vault resource ID as string"
  value       = azurerm_recovery_services_vault.vault.id
}

output "data" {
  value = {
    id                  = azurerm_recovery_services_vault.vault.id
    vault_name          = azurerm_recovery_services_vault.vault.name
    resource_group_name = local.resource_group_name
  }
}

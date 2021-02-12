output "result" {
  description = "The policy resource"
  value       = data.azurerm_backup_policy_vm.policy
}

output "id" {
  description = "The policy resource ID as string"
  value       = data.azurerm_backup_policy_vm.policy.id
}

output "data" {
  value = {
    resource_group_name = data.azurerm_backup_policy_vm.policy.resource_group_name
    vault_name          = data.azurerm_backup_policy_vm.policy.recovery_vault_name
    policy_name         = data.azurerm_backup_policy_vm.policy.name
    policy_id           = data.azurerm_backup_policy_vm.policy.id
  }
}

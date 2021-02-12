resource "azurerm_backup_protected_vm" "default" {
  resource_group_name = var.backup_policy.resource_group_name
  recovery_vault_name = var.backup_policy.vault_name
  backup_policy_id    = var.backup_policy.policy_id
  source_vm_id        = var.vm.id
}

data "azurerm_backup_policy_vm" "policy" {
  name                = var.policy_name
  resource_group_name = var.backup_vault.resource_group_name
  recovery_vault_name = var.backup_vault.vault_name
}

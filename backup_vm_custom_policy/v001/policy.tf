resource "azurerm_backup_policy_vm" "policy" {
  name                = var.policy_name
  resource_group_name = var.backup_vault.resource_group_name
  recovery_vault_name = var.backup_vault.vault_name

  timezone = "UTC"

  dynamic "backup" {
    for_each = var.frequency == "Daily" ? [1] : []
    content {
      frequency = "Daily"
      time      = var.time
    }
  }

  dynamic "backup" {
    for_each = var.frequency == "Weekly" ? [1] : []
    content {
      frequency = "Weekly"
      time      = var.time
      weekdays  = var.weekdays
    }
  }

  dynamic "retention_daily" {
    for_each = var.retention_daily.count > 0 ? [1] : []
    content {
      count = var.retention_daily.count
    }
  }

  dynamic "retention_weekly" {
    for_each = var.retention_weekly.count > 0 ? [1] : []
    content {
      count    = var.retention_weekly.count
      weekdays = var.retention_weeky.weekdays
    }
  }

  dynamic "retention_monthly" {
    for_each = var.retention_monthly.count > 0 ? [1] : []
    content {
      count    = var.retention_monthly.count
      weekdays = var.retention_monthly.weekdays
      weeks    = var.retention_monthly.weeks
    }
  }

  dynamic "retention_yearly" {
    for_each = var.retention_yearly.count > 0 ? [1] : []
    content {
      count    = var.retention_yearly.count
      weekdays = var.retention_yearly.weekdays
      weeks    = var.retention_yearly.weeks
      months   = var.retention_yearly.months
    }
  }
}

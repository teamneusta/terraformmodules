# Diagnostics
resource "azurerm_monitor_diagnostic_setting" "ip" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_storage_account.storage.name
  target_resource_id         = azurerm_storage_account.storage.id
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

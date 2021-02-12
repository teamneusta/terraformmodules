resource "azurerm_monitor_diagnostic_setting" "data_disk" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_managed_disk.data_disk.name
  target_resource_id         = azurerm_managed_disk.data_disk.id
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

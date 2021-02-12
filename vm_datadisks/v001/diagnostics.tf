resource "azurerm_monitor_diagnostic_setting" "data_disk" {
  count = var.log_analytics != null ? length(var.disk_sizes_gb) : 0

  name                       = element(azurerm_managed_disk.data_disk, count.index).name
  target_resource_id         = element(azurerm_managed_disk.data_disk, count.index).id
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

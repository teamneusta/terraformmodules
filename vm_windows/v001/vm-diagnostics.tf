resource "azurerm_monitor_diagnostic_setting" "vm" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_windows_virtual_machine.vm.name
  target_resource_id         = azurerm_windows_virtual_machine.vm.id
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

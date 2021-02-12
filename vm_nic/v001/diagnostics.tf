resource "azurerm_monitor_diagnostic_setting" "nic" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_network_interface.nic.name
  target_resource_id         = azurerm_network_interface.nic.id
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

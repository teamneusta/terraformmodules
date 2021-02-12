resource "azurerm_monitor_diagnostic_setting" "sql" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_mssql_server.sql.name
  target_resource_id         = azurerm_mssql_server.sql.id
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

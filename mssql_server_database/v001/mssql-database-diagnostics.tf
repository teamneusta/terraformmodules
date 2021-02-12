resource "azurerm_monitor_diagnostic_setting" "sqldb" {
  for_each = var.log_analytics == null ? {} : {
    for x in var.databases :
    x.name => lookup(azurerm_sql_database.sqldb, x.name, "name").id
  }

  name                       = each.key
  target_resource_id         = each.value
  log_analytics_workspace_id = var.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

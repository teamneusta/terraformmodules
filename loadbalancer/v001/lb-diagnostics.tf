resource "azurerm_monitor_diagnostic_setting" "lb-diagnostics" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_lb.lb.name
  target_resource_id         = azurerm_lb.lb.id
  log_analytics_workspace_id = var.log_analytics.id

  log {
    category = "LoadBalancerAlertEvent"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "LoadBalancerProbeHealthStatus"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}
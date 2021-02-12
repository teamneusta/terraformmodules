resource "azurerm_monitor_diagnostic_setting" "gateway-diagnostics" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_application_gateway.gateway.name
  target_resource_id         = azurerm_application_gateway.gateway.id
  log_analytics_workspace_id = var.log_analytics.id

  log {
    category = "ApplicationGatewayAccessLog"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ApplicationGatewayPerformanceLog"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ApplicationGatewayFirewallLog"
    enabled  = false
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

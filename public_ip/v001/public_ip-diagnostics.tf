# Diagnostics
resource "azurerm_monitor_diagnostic_setting" "ip" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_public_ip.ip.name
  target_resource_id         = azurerm_public_ip.ip.id
  log_analytics_workspace_id = var.log_analytics.id

  log {
    category = "DDoSProtectionNotifications"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DDoSMitigationFlowLogs"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DDoSMitigationReports"
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

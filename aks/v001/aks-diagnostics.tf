resource "azurerm_monitor_diagnostic_setting" "aks-diagnostics" {
  count = var.log_analytics != null ? 1 : 0

  name                       = azurerm_kubernetes_cluster.aks.name
  target_resource_id         = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id = var.log_analytics.id

  log {
    category = "cluster-autoscaler"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "guard"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-apiserver"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-audit"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-audit-admin"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-controller-manager"
    enabled  = false
    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-scheduler"
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

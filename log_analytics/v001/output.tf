output "result" {
  value = azurerm_log_analytics_workspace.workspace
}

output "id" {
  value = azurerm_log_analytics_workspace.workspace.id
}

output "data" {
  value = {
    id                 = azurerm_log_analytics_workspace.workspace.id,
    workspace_id       = azurerm_log_analytics_workspace.workspace.workspace_id,
    primary_shared_key = azurerm_log_analytics_workspace.workspace.primary_shared_key
  }
}

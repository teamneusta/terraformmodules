# LogAnalytics ContainerInsights solution
resource "azurerm_log_analytics_solution" "containerinsights" {
  count = var.enable_container_insights ? 1 : 0

  solution_name         = "ContainerInsights"
  resource_group_name   = local.resource_group_name
  location              = local.location
  workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
  workspace_name        = azurerm_log_analytics_workspace.workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
# LogAnalytics Workspace
resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "${local.resource_name_prefix}-workspace-${random_id.loganalytics_workspace.hex}"
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = "PerGB2018"
}

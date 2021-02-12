resource "azurerm_virtual_machine_extension" "vm_dependencyAgent" {
  count = var.enable_extension ? 1 : 0

  name                       = "DependencyAgentWindows"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.5"
  auto_upgrade_minor_version = true
}

resource "azurerm_virtual_machine_extension" "vm_omsAgent" {
  count = var.enable_extension ? 1 : 0

  name                       = "OMSExtension"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "workspaceId": "${var.log_analytics.workspace_id}",
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "workspaceKey": "${var.log_analytics.primary_shared_key}"
    }
PROTECTED_SETTINGS

  depends_on = [azurerm_virtual_machine_extension.vm_dependencyAgent]
}
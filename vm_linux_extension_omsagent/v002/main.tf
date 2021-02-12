resource "azurerm_virtual_machine_extension" "vm_dependencyAgent" {
  name                       = "DependencyAgentLinux"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentLinux"
  type_handler_version       = "9.5"
  auto_upgrade_minor_version = true
}

resource "azurerm_virtual_machine_extension" "vm_omsAgent" {
  name                       = "OMSExtension"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  type                       = "OmsAgentForLinux"
  type_handler_version       = "1.7"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "workspaceId": "${var.log_analytics.workspace_id}",
        "azureResourceId": "${var.vm.id}",
        "stopOnMultipleConnections": "true"
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "workspaceKey": "${var.log_analytics.primary_shared_key}"
    }
PROTECTED_SETTINGS

  depends_on = [azurerm_virtual_machine_extension.vm_dependencyAgent]
}
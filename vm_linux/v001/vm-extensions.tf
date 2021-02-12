module "extension_diagnostics" {
  source = "../../vm_linux_extension_diagnostics/v001"

  vm                  = azurerm_linux_virtual_machine.vm
  diagnostics_storage = var.diagnostics_storage
  enable_extension    = var.enable_diagnostics_extension && var.diagnostics_storage.id != ""
}

module "extension_omsagent" {
  source = "../../vm_linux_extension_omsagent/v001"

  vm               = azurerm_linux_virtual_machine.vm
  log_analytics    = var.log_analytics
  enable_extension = var.enable_omsagent_extension && var.log_analytics.workspace_id != ""
}

module "extension_puppet" {
  source = "../../vm_linux_extension_puppet/v001"

  environment      = var.environment
  vm               = azurerm_linux_virtual_machine.vm
  enable_extension = var.enable_puppet_extension
}

module "extension_diagnostics" {
  source = "../../vm_linux_extension_diagnostics/v002"
  count  = var.enable_diagnostics_extension && var.diagnostics_storage != null ? 1 : 0

  vm                  = azurerm_linux_virtual_machine.vm
  diagnostics_storage = var.diagnostics_storage
}

module "extension_omsagent" {
  source = "../../vm_linux_extension_omsagent/v002"
  count  = var.enable_omsagent_extension && var.log_analytics != null ? 1 : 0

  vm            = azurerm_linux_virtual_machine.vm
  log_analytics = var.log_analytics
}

module "extension_puppet" {
  source = "../../vm_linux_extension_puppet/v002"
  count  = var.enable_puppet_extension ? 1 : 0

  environment = var.environment
  vm          = azurerm_linux_virtual_machine.vm
}

module "extension_diagnostics" {
  source = "../../vm_windows_extension_diagnostics/v001"

  vm                  = azurerm_windows_virtual_machine.vm
  diagnostics_storage = var.diagnostics_storage
  enable_extension    = var.enable_diagnostics_extension && var.diagnostics_storage != null
}

module "extension_omsagent" {
  source = "../../vm_windows_extension_omsagent/v001"

  vm               = azurerm_windows_virtual_machine.vm
  log_analytics    = var.log_analytics
  enable_extension = var.enable_omsagent_extension && var.log_analytics != null
}

module "extension_antimalware" {
  source = "../../vm_windows_extension_antimalware/v001"

  vm               = azurerm_windows_virtual_machine.vm
  enable_extension = var.enable_antimalware_extension
}

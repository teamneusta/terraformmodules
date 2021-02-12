module "extension_diagnostics" {
  source = "../../vm_windows_extension_diagnostics/v002"
  count  = var.enable_diagnostics_extension && var.diagnostics_storage != null ? 1 : 0

  vm                  = azurerm_windows_virtual_machine.vm
  diagnostics_storage = var.diagnostics_storage
}

module "extension_omsagent" {
  source = "../../vm_windows_extension_omsagent/v002"
  count  = var.enable_omsagent_extension && var.log_analytics != null ? 1 : 0

  vm            = azurerm_windows_virtual_machine.vm
  log_analytics = var.log_analytics
}

module "extension_antimalware" {
  source = "../../vm_windows_extension_antimalware/v002"
  count  = var.enable_antimalware_extension ? 1 : 0

  vm = azurerm_windows_virtual_machine.vm
}

module "extension_nvidiadrivers" {
  source = "../../vm_windows_extension_nvidiadrivers/v002"
  count  = var.enable_nvidiadrivers_extension ? 1 : 0

  vm = azurerm_windows_virtual_machine.vm
}

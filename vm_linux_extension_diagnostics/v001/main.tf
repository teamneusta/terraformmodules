resource "azurerm_virtual_machine_extension" "vm_linuxDiagnostics" {
  count = var.enable_extension ? 1 : 0

  name                       = "LinuxDiagnostic"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.Azure.Diagnostics"
  type                       = "LinuxDiagnostic"
  type_handler_version       = "3.0"
  auto_upgrade_minor_version = true

  settings = data.template_file.config[0].rendered

  protected_settings = <<PROTECTED_SETTINGS
    {
        "storageAccountName": "${var.diagnostics_storage.name}",
        "storageAccountSasToken": "${data.azurerm_storage_account_sas.diagnostics_storage[0].sas}"
    }
PROTECTED_SETTINGS
}

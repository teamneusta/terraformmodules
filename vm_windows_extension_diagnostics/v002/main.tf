resource "azurerm_virtual_machine_extension" "vm_iaaSDiagnostics" {
  name                       = "IaaSDiagnostics"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.Azure.Diagnostics"
  type                       = "IaaSDiagnostics"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "xmlCfg": "${base64encode(data.template_file.config.rendered)}",
        "storageAccount": "${var.diagnostics_storage.name}"
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "storageAccountName": "${var.diagnostics_storage.name}",
        "storageAccountKey": "${var.diagnostics_storage.primary_access_key}",
        "storageAccountEndPoint": "https://core.windows.net"
    }
PROTECTED_SETTINGS
}
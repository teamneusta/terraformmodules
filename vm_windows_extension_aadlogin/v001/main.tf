resource "azurerm_virtual_machine_extension" "vm_aadLoginWindows" {
  count = var.enable_extension ? 1 : 0

  name                       = "AADLoginForWindows"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADLoginForWindows"
  type_handler_version       = "0.4"
  auto_upgrade_minor_version = true
}
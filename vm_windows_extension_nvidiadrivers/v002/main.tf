resource "azurerm_virtual_machine_extension" "vm_nvidiadrivers" {
  name                       = "NvidiaGpuDriverWindows"
  virtual_machine_id         = var.vm.id
  publisher                  = "Microsoft.HpcCompute"
  type                       = "NvidiaGpuDriverWindows"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true
}
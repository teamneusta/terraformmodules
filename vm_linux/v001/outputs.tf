output "result" {
  description = "The linux virtual machine resource"
  value       = azurerm_linux_virtual_machine.vm
}

output "id" {
  description = "The resource ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "data" {
  description = "The virtual machine data"
  value = {
    id                 = azurerm_linux_virtual_machine.vm.id
    name               = azurerm_linux_virtual_machine.vm.name
    virtual_machine_id = azurerm_windows_virtual_machine.vm.virtual_machine_id
    admin_username     = azurerm_windows_virtual_machine.vm.admin_username
    admin_password     = azurerm_windows_virtual_machine.vm.admin_password
    computer_name      = azurerm_windows_virtual_machine.vm.computer_name
  }
}

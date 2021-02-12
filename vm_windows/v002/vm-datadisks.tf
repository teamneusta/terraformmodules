resource "azurerm_virtual_machine_data_disk_attachment" "data_disk" {
  count = length(var.data_disks)

  virtual_machine_id = azurerm_windows_virtual_machine.vm.id
  managed_disk_id    = element(var.data_disks, count.index).id
  lun                = count.index
  caching            = var.data_disk_caching
}
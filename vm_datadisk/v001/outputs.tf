output "result" {
  value = azurerm_managed_disk.data_disk[0]
}

output "id" {
  value = azurerm_managed_disk.data_disk[0].id
}

output "data" {
  value = {
    name = azurerm_managed_disk.data_disk[0].name
    id   = azurerm_managed_disk.data_disk[0].id
  }
}

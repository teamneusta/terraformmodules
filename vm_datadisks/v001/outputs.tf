output "result" {
  value = {
    for disk in azurerm_managed_disk.data_disk :
    disk.name => disk
  }
}

output "data" {
  value = values({
    for disk in azurerm_managed_disk.data_disk :
    disk.name => {
      name = disk.name
      id   = disk.id
    }
  })
}

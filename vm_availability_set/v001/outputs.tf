output "result" {
  value = azurerm_availability_set.default
}

output "id" {
  value = azurerm_availability_set.default.id
}

output "data" {
  value = {
    id = azurerm_availability_set.default.id
  }
}

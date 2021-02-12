output "result" {
  description = "The storage account resource"
  value       = azurerm_storage_account.storage
}

output "id" {
  description = "The resource ID of the storage account"
  value       = azurerm_storage_account.storage.id
}

output "data" {
  description = "The storage account data"
  value = {
    id                        = azurerm_storage_account.storage.id
    name                      = azurerm_storage_account.storage.name
    primary_access_key        = azurerm_storage_account.storage.primary_access_key
    primary_blob_endpoint     = azurerm_storage_account.storage.primary_blob_endpoint
    primary_connection_string = azurerm_storage_account.storage.primary_connection_string
  }
}

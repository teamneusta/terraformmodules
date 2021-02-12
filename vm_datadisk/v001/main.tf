resource "azurerm_managed_disk" "data_disk" {
  count = 1

  name                 = local.resource_name
  location             = local.location
  resource_group_name  = local.resource_group_name
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  storage_account_type = var.disk_type
}

resource "azurerm_managed_disk" "data_disk" {
  count = length(var.disk_sizes_gb)

  name                 = "${local.resource_name}_${count.index}"
  location             = local.location
  resource_group_name  = local.resource_group_name
  create_option        = "Empty"
  disk_size_gb         = element(var.disk_sizes_gb, count.index)
  storage_account_type = var.disk_type
}

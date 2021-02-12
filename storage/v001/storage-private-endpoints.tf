resource "azurerm_private_endpoint" "storage_private_endpoint" {
  count = length(var.private_endpoint_subnets)

  name                = "${local.resource_name}_pep${count.index}"
  resource_group_name = local.resource_group_name
  location            = local.location
  subnet_id           = element(var.private_endpoint_subnets, count.index).id

  private_service_connection {
    name                           = "privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.storage.id
    subresource_names              = var.private_endpoint_subresource_names
    is_manual_connection           = false
  }
}
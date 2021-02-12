resource "azurerm_private_dns_a_record" "storage_privatelink_blob_dns_record" {
  count = var.privatelink_blob_dns_zone != null ? length(var.private_endpoint_subnets) : 0

  name                = azurerm_storage_account.storage.name
  resource_group_name = var.privatelink_blob_dns_zone.resource_group_name
  zone_name           = var.privatelink_blob_dns_zone.name
  ttl                 = 300
  records             = [element(azurerm_private_endpoint.storage_private_endpoint, count.index).private_service_connection[0].private_ip_address]
}
resource "azurerm_private_dns_a_record" "sql_private_dns_record" {
  count = var.privatelink_dns_zone != null ? length(var.private_endpoint_subnets) : 0

  name                = azurerm_mssql_server.sql.name
  resource_group_name = var.privatelink_dns_zone.resource_group_name
  zone_name           = var.privatelink_dns_zone.name
  ttl                 = 300
  records             = [element(azurerm_private_endpoint.sql_private_endpoint, count.index).private_service_connection[0].private_ip_address]
}
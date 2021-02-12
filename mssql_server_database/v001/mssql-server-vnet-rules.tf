resource "azurerm_sql_virtual_network_rule" "sql_vnetrule" {
  count = length(var.vnet_rule_subnets)

  name                = "sql-vnet-rule${count.index}"
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mssql_server.sql.name
  subnet_id           = element(var.vnet_rule_subnets, count.index).id
}

resource "azurerm_sql_database" "sqldb" {
  for_each = {
    for x in var.databases :
    x.name => x
  }

  name                = each.key
  resource_group_name = azurerm_mssql_server.sql.resource_group_name
  server_name         = azurerm_mssql_server.sql.name
  location            = azurerm_mssql_server.sql.location

  lifecycle {
    ignore_changes = [
      tags,
      edition,
      collation,
      max_size_bytes,
      requested_service_objective_name
    ]
  }

  create_mode                      = "Default"
  edition                          = each.value.edition
  collation                        = each.value.collation
  max_size_bytes                   = each.value.max_size_gb * 1024 * 1024 * 1024
  requested_service_objective_name = each.value.requested_service_objective_name
}
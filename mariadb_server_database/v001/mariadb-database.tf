resource "azurerm_mariadb_database" "mariadb" {
  for_each = {
    for x in var.databases :
    x.name => x
  }

  name                = each.key
  resource_group_name = azurerm_mariadb_server.mariadb.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  charset             = each.value.charset
  collation           = each.value.collation

  lifecycle {
    ignore_changes = [
      collation,
      charset
    ]
  }
}
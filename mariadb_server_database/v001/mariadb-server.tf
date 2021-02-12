resource "azurerm_mariadb_server" "mariadb" {
  name                          = local.resource_name
  resource_group_name           = local.resource_group_name
  location                      = local.location
  version                       = var.server_version
  administrator_login           = var.server_administrator_login
  administrator_login_password  = local.server_administrator_password
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  auto_grow_enabled             = true
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = true
  ssl_enforcement_enabled       = true
  restore_point_in_time         = null
  creation_source_server_id     = null
  create_mode                   = null
  tags                          = var.tags

  lifecycle {
    ignore_changes = [
      tags,
      administrator_login,
      administrator_login_password
    ]
  }
}
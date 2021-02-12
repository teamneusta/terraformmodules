resource "azurerm_mssql_server" "sql" {
  name                = local.resource_name
  resource_group_name = local.resource_group_name
  location            = local.location

  lifecycle {
    ignore_changes = [
      tags,
      administrator_login,
      administrator_login_password
    ]
  }

  version                       = var.server_version
  administrator_login           = var.server_administrator_login
  administrator_login_password  = local.server_administrator_password
  public_network_access_enabled = var.firewall_allow_public_network_access
  minimum_tls_version           = var.minimum_tls_version

  dynamic "azuread_administrator" {
    for_each = var.activedirectory_admin != null ? [1] : []
    content {
      login_username = var.activedirectory_admin.login_username
      object_id      = var.activedirectory_admin.object_id
      tenant_id      = coalesce(var.activedirectory_admin.tenant_id, data.azurerm_client_config.current.tenant_id)
    }
  }

  dynamic "identity" {
    for_each = var.system_assigned_identity ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  tags = merge(
    var.tags,
    {
      InitialAdminLogin    = var.server_administrator_login
      InitialAdminPassword = local.server_administrator_password
  })
}

# Custom Rules

resource "azurerm_mariadb_firewall_rule" "rule" {
  for_each = {
    for x in var.firewall_rules :
    x.name => x
  }

  name                = each.value.name
  resource_group_name = azurerm_mariadb_server.mariadb.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
}

# Azure Access

resource "azurerm_mariadb_firewall_rule" "azure_access" {
  count = var.firewall_allow_azure_access ? 1 : 0

  name                = "azure-access"
  resource_group_name = azurerm_mariadb_server.mariadb.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# NEUSTA Access

module "teamneusta" {
  source = "../teamneusta"
}

resource "azurerm_mariadb_firewall_rule" "neusta" {
  for_each = var.firewall_allow_neusta_access ? module.teamneusta.ip_ranges : {}

  name                = replace("neusta-${each.key}", "_", "-")
  resource_group_name = azurerm_mariadb_server.mariadb.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
}

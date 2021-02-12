resource "azurerm_storage_account_network_rules" "storage_networkrule" {
  count = !var.network_rule_allow_public_access || length(var.network_rule_subnets) > 0 || length(var.network_rule_bypass) > 0 || length(var.network_rule_ip_rules) > 0 ? 1 : 0

  resource_group_name        = local.resource_group_name
  storage_account_name       = azurerm_storage_account.storage.name
  virtual_network_subnet_ids = var.network_rule_subnets.*.id
  default_action             = var.network_rule_allow_public_access ? "Allow" : "Deny"
  bypass                     = length(var.network_rule_bypass) > 0 ? var.network_rule_bypass : ["None"]
  ip_rules                   = var.network_rule_ip_rules
}

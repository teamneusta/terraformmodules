resource "azurerm_network_interface_nat_rule_association" "default" {
  for_each = var.nat_rules

  network_interface_id  = var.nic.id
  ip_configuration_name = var.nic.configuration_name
  nat_rule_id           = each.value.id
}
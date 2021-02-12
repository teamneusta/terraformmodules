resource "azurerm_network_interface_nat_rule_association" "default" {
  for_each = {
    for x in [var.nat_rule.name] :
    x => x
  }

  network_interface_id  = var.nic.id
  ip_configuration_name = var.nic.configuration_name
  nat_rule_id           = var.nat_rule.id
}
output "data" {
  value = {
    for rule in azurerm_lb_nat_rule.nat_rule :
    substr(rule.name, 0, length(rule.name) - 8) => {
      id   = rule.id
      name = substr(rule.name, 0, length(rule.name) - 8)
    }
  }
}
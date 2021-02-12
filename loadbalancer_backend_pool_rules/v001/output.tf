output "data" {
  value = {
    for rule in azurerm_lb_rule.rule :
    substr(rule.name, 0, length(rule.name) - 5) => {
      id   = rule.id
      name = substr(rule.name, 0, length(rule.name) - 5)
    }
  }
}

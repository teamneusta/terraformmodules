data "azurerm_subscription" "current" {
}

data "azurerm_resource_group" "current" {
  name = local.resource_group_name
}

data "azurerm_role_definition" "acrpull" {
  name  = "AcrPull"
  scope = data.azurerm_subscription.current.id
}

data "azurerm_role_definition" "owner" {
  name  = "Owner"
  scope = data.azurerm_subscription.current.id
}

data "azurerm_role_definition" "network_contributor" {
  name  = "Network Contributor"
  scope = data.azurerm_subscription.current.id
}

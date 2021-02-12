data "azurerm_subscription" "current" {
}

data "azurerm_role_definition" "acrpull" {
  name  = "AcrPull"
  scope = data.azurerm_subscription.current.id
}

resource "azurerm_role_assignment" "acrpull_access" {
  for_each = {
    for x in var.identities_acrpull :
    x.object_id => x
  }

  scope              = azurerm_container_registry.acr.id
  principal_id       = each.key
  role_definition_id = data.azurerm_role_definition.acrpull.id
}

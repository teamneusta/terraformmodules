resource "azurerm_user_assigned_identity" "identity" {
  resource_group_name = local.resource_group_name
  location            = local.location
  name                = local.identity_name
}
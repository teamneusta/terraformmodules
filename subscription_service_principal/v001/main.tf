# Get the current subscription
data "azurerm_subscription" "current" {
}

# Create an application
resource "azuread_application" "application" {
  name                       = "Subscription Service Principal for '${data.azurerm_subscription.current.display_name}'"
  homepage                   = var.homepage_url
  identifier_uris            = []
  reply_urls                 = []
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
}

# Create a service principal
resource "azuread_service_principal" "service_principal" {
  application_id = azuread_application.application.application_id
}

# Create a random password as client secret
resource "random_password" "client_secret" {
  keepers = {
    service_principal = azuread_service_principal.service_principal.id
  }
  length = 32
}

# Set the client secret
resource "azuread_service_principal_password" "service_principal" {
  service_principal_id = azuread_service_principal.service_principal.id
  value                = random_password.client_secret.result
  end_date             = "2199-12-31T00:00:00Z"
}

# Get the Contributor role definition
data "azurerm_role_definition" "contributor" {
  name  = "Contributor"
  scope = data.azurerm_subscription.current.id
}

# Assign Contributor role for subscription
resource "azurerm_role_assignment" "service_principal_subscription_access" {
  scope              = data.azurerm_subscription.current.id
  principal_id       = azuread_service_principal.service_principal.id
  role_definition_id = data.azurerm_role_definition.contributor.id
}

output "result" {
  value       = azurerm_user_assigned_identity.identity
  description = "The identity resource"
}

output "id" {
  value       = azurerm_user_assigned_identity.identity.id
  description = "The resource ID of the identity resource"
}

output "object_id" {
  value       = azurerm_user_assigned_identity.identity.principal_id
  description = "The Service Principal ID associated with the user assigned identity"
}

output "client_id" {
  value       = azurerm_user_assigned_identity.identity.client_id
  description = "The Client ID associated with the user assigned identity"
}

output "data" {
  description = "The user assigned identitiy data"
  value = {
    id        = azurerm_user_assigned_identity.identity.id
    client_id = azurerm_user_assigned_identity.identity.client_id
    object_id = azurerm_user_assigned_identity.identity.principal_id
  }
}

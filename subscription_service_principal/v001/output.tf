output "result" {
  value       = azuread_service_principal.service_principal
  description = "The service principal resource"
}

output "id" {
  value       = azuread_service_principal.service_principal.id
  description = "The service principal resource ID"
}

output "object_id" {
  value       = azuread_service_principal.service_principal.object_id
  description = "The object ID in the AAD of the service principal"
}

output "client_id" {
  value       = azuread_service_principal.service_principal.application_id
  description = "The service principal client/application ID"
}

output "client_secret" {
  value       = random_password.client_secret.result
  description = "The service principal client secret"
}

output "data" {
  description = "The service principal data"
  value = {
    id            = azuread_service_principal.service_principal.id
    client_id     = azuread_service_principal.service_principal.application_id
    client_secret = random_password.client_secret.result
    object_id     = azuread_service_principal.service_principal.object_id
  }
}

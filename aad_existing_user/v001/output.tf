output "result" {
  value       = data.azuread_user.user
  description = "The user resource"
}

output "id" {
  value       = data.azuread_user.user.id
  description = "The user resource ID"
}

output "object_id" {
  value       = data.azuread_user.user.id
  description = "The object ID in the AAD of the user"
}

output "data" {
  description = "The user data"
  value = {
    id        = data.azuread_user.user.id
    login     = data.azuread_user.user.user_principal_name
    object_id = data.azuread_user.user.id
  }
}

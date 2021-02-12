output "result" {
  description = "The resource group resource"
  value       = azurerm_resource_group.default[var.resource_group_name]
}

output "id" {
  description = "The resource ID of the resource group as string"
  value       = azurerm_resource_group.default[var.resource_group_name].id
}

output "name" {
  description = "The full qualified name of the resource group"
  value       = azurerm_resource_group.default[var.resource_group_name].name
}

output "data" {
  description = "The names and IDs of the resource groups"
  value = {
    for rgroup in azurerm_resource_group.default :
    substr(rgroup.name, length(local.project_name) + 1, 256) => {
      name     = rgroup.name
      location = rgroup.location
      id       = rgroup.id
    }
  }
}

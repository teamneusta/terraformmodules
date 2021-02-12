output "data" {
  description = "The names and IDs of the resource groups"
  value = {
    for rgroup in azurerm_resource_group.default :
    substr(rgroup.name, length(local.resource_name_prefix) + 1, 256) => {
      name     = rgroup.name
      location = rgroup.location
      id       = rgroup.id
    }
  }
}

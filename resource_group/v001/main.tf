# Create Resource Groups
resource "azurerm_resource_group" "default" {
  for_each = {
    for x in local.resource_group_names :
    x => local.location
  }
  name     = local.resource_group_name
  location = local.location
}

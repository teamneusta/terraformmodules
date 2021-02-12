# Create Resource Groups
resource "azurerm_resource_group" "default" {
  for_each = {
    for x in var.resource_groups :
    x.name => x.location != "" ? x.location : local.location
  }

  name     = "${local.resource_name_prefix}-${each.key}"
  location = each.value
}

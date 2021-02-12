# Create Subnets
resource "azurerm_subnet" "default" {
  for_each = {
    for x in var.subnets :
    x.name => x
  }

  name                 = trim("${local.subnet_name_prefix}-${each.key}", "-")
  resource_group_name  = var.virtual_network.resource_group_name
  virtual_network_name = var.virtual_network.name
  address_prefixes     = [each.value.address_prefix]
  service_endpoints    = each.value.service_endpoints

  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies && length(each.value.service_endpoints) > 0
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies && length(each.value.service_endpoints) > 0
}

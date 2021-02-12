resource "azurerm_availability_set" "default" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name

  platform_update_domain_count = var.update_domain_count
  platform_fault_domain_count  = var.fault_domain_count
}
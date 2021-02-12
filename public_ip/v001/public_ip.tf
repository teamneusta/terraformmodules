# Create public IP
resource "azurerm_public_ip" "ip" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name

  sku                     = var.sku
  ip_version              = var.ip_version
  allocation_method       = var.allocation_method
  domain_name_label       = local.domain_name_label
  reverse_fqdn            = var.reverse_fqdn
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
}

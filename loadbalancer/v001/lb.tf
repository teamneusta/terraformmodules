# Create load balancer
resource "azurerm_lb" "lb" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.sku

  dynamic "frontend_ip_configuration" {
    for_each = var.private_ip_address != "" ? [1] : []
    content {
      name                          = "default"
      subnet_id                     = var.subnet.id
      private_ip_address_allocation = "Static"
      private_ip_address            = var.private_ip_address
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.public_ip.id != "" ? [1] : []
    content {
      name                 = "default"
      public_ip_address_id = var.public_ip.id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.private_ip_address == "" && var.public_ip.id == "" ? [1] : []
    content {
      name                          = "default"
      subnet_id                     = var.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
  }
}

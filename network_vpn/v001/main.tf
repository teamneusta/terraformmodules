resource "azurerm_virtual_network_gateway" "default" {
  name                = local.resource_name
  resource_group_name = local.resource_group_name
  location            = local.location

  type          = "Vpn"
  vpn_type      = var.vpn_type
  enable_bgp    = false
  active_active = false
  sku           = var.sku
  generation    = var.generation

  ip_configuration {
    subnet_id            = var.subnet.id
    public_ip_address_id = var.public_ip.id
  }
}

resource "azurerm_local_network_gateway" "default" {
  for_each = var.connections

  name                = "${local.resource_name}_${each.key}"
  resource_group_name = local.resource_group_name
  location            = local.location

  gateway_address = each.value.gateway_address
  address_space   = each.value.address_space
}


resource "azurerm_virtual_network_gateway_connection" "default" {
  for_each = var.connections

  name                = "${local.resource_name}_${each.key}"
  location            = local.location
  resource_group_name = local.resource_group_name

  type                       = "IPsec"
  connection_protocol        = each.value.connection_protocol
  virtual_network_gateway_id = azurerm_virtual_network_gateway.default.id
  local_network_gateway_id   = azurerm_local_network_gateway.default[each.key].id
  shared_key                 = each.value.shared_key
}
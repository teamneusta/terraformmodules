# Create the AppGw for external domain
resource "azurerm_application_gateway" "gateway" {
  name                = local.resource_name
  location            = local.location
  resource_group_name = local.resource_group_name
  enable_http2        = true

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = var.appgw_capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet.id
  }

  dynamic "frontend_port" {
    for_each = var.http_listener_ports
    content {
      name = "port${frontend_port.value}"
      port = frontend_port.value
    }
  }

  dynamic "frontend_port" {
    for_each = var.https_listener_ports
    content {
      name = "port${frontend_port.value}"
      port = frontend_port.value
    }
  }

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIP"
    public_ip_address_id = var.public_ip.id
  }

  # --- http to https

  dynamic "http_listener" {
    for_each = var.http_listener_ports
    content {
      name                           = "port${http_listener.value}Listener"
      frontend_ip_configuration_name = "appGatewayFrontendIP"
      frontend_port_name             = "port${http_listener.value}"
      protocol                       = "Http"
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.http_listener_ports
    content {
      name                        = "port${request_routing_rule.value}ToHttpsRule"
      rule_type                   = "Basic"
      http_listener_name          = "port${request_routing_rule.value}Listener"
      redirect_configuration_name = "redirectToHttps"
    }
  }

  dynamic "redirect_configuration" {
    for_each = length(var.https_listener_ports) > 0 ? [var.https_listener_ports[0]] : []
    content {
      name                 = "redirectToHttps"
      redirect_type        = "Permanent"
      target_listener_name = "port${redirect_configuration.value}Listener"
      include_path         = true
      include_query_string = true
    }
  }

  # --- https listener rules

  dynamic "http_listener" {
    for_each = var.https_listener_ports
    content {
      name                           = "port${http_listener.value}Listener"
      frontend_ip_configuration_name = "appGatewayFrontendIP"
      frontend_port_name             = "port${http_listener.value}"
      protocol                       = "Https"
      ssl_certificate_name           = var.https_listener_ssl_certificate_name
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.https_listener_ports
    content {
      name                       = "port${request_routing_rule.value}BasicRule"
      rule_type                  = "Basic"
      http_listener_name         = "port${request_routing_rule.value}Listener"
      backend_address_pool_name  = "defaultBackendPool"
      backend_http_settings_name = "httpBackendSettings"
    }
  }

  # --- forward ports

  dynamic "frontend_port" {
    for_each = var.forward_ports
    content {
      name = "port${frontend_port.value}"
      port = frontend_port.value
    }
  }

  dynamic "http_listener" {
    for_each = var.forward_ports
    content {
      name                           = "port${http_listener.value}Listener"
      frontend_ip_configuration_name = "appGatewayFrontendIP"
      frontend_port_name             = "port${http_listener.value}"
      protocol                       = "Https"
      ssl_certificate_name           = var.https_listener_ssl_certificate_name
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.forward_ports
    content {
      name                       = "port${request_routing_rule.value}BasicRule"
      rule_type                  = "Basic"
      http_listener_name         = "port${request_routing_rule.value}Listener"
      backend_address_pool_name  = "defaultBackendPool"
      backend_http_settings_name = "port${request_routing_rule.value}BackendSettings"
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.forward_ports
    content {
      name                  = "port${backend_http_settings.value}BackendSettings"
      cookie_based_affinity = "Disabled"
      port                  = backend_http_settings.value
      protocol              = "Http"
      request_timeout       = var.backend_request_timeout
      probe_name            = "httpProbe"
      host_name             = var.backend_host_name != "" ? var.backend_host_name : null
    }
  }

  # --- http backend settings and probe

  backend_http_settings {
    name                  = "httpBackendSettings"
    cookie_based_affinity = "Disabled"
    port                  = var.backend_port
    protocol              = "Http"
    request_timeout       = var.backend_request_timeout
    probe_name            = "httpProbe"
    host_name             = var.backend_host_name != "" ? var.backend_host_name : null
  }

  probe {
    name                                      = "httpProbe"
    host                                      = var.probe_host_name != "" ? var.probe_host_name : var.backend_host_name != "" ? var.backend_host_name : "127.0.0.1"
    pick_host_name_from_backend_http_settings = var.probe_host_name == "" && var.backend_host_name != ""
    path                                      = var.probe_path != "" ? var.probe_path : "/"
    protocol                                  = "Http"
    interval                                  = 60
    timeout                                   = var.backend_request_timeout
    unhealthy_threshold                       = 2
    minimum_servers                           = 1
    match {
      status_code = var.probe_match_status_code
      body        = var.probe_match_body
    }
  }

  # --- backend pool

  dynamic "backend_address_pool" {
    for_each = length(var.backend_node_ips) > 0 ? [1] : []
    content {
      name         = "defaultBackendPool"
      ip_addresses = var.backend_node_ips
    }
  }

  dynamic "backend_address_pool" {
    for_each = length(var.backend_node_ips) > 0 ? [] : [1]
    content {
      name = "defaultBackendPool"
    }
  }

  # --- identities

  dynamic "identity" {
    for_each = length(var.user_assigned_identities) != 0 ? [1] : []
    content {
      type         = "UserAssigned"
      identity_ids = var.user_assigned_identities.*.id
    }
  }

  # --- ssl certificates

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificate_secrets
    content {
      name                = ssl_certificate.value.name
      key_vault_secret_id = ssl_certificate.value.secret_identifier
    }
  }

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificate_files
    content {
      name     = ssl_certificate.value.name
      data     = ssl_certificate.value.data
      password = ssl_certificate.value.password
    }
  }

  ssl_certificate {
    name     = "DummyCertificate"
    data     = filebase64("${path.module}/../data/dummy-certificate.pfx")
    password = "12345"
  }

  ssl_policy {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20170401"
  }

  tags = var.tags
}

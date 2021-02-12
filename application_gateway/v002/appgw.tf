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

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIP"
    public_ip_address_id = var.public_ip.id
  }

  # --- frontend ports

  dynamic "frontend_port" {
    for_each = var.frontend_ports
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  # --- redirect listener

  dynamic "http_listener" {
    for_each = var.redirect_listener
    content {
      name                           = "${http_listener.value.name}Listener"
      frontend_ip_configuration_name = "appGatewayFrontendIP"
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
      ssl_certificate_name           = coalesce(var.http_listener.value.ssl_certificate_name, var.default_ssl_certificate_name)
      host_names                     = length(var.http_listener.value.host_names) > 0 ? var.http_listener.value.host_names : null
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.redirect_listener
    content {
      name                        = "${request_routing_rule.value.name}RedirectRule"
      rule_type                   = "Basic"
      http_listener_name          = "${request_routing_rule.value.name}Listener"
      redirect_configuration_name = "${request_routing_rule.value.name}Redirect"
    }
  }

  dynamic "redirect_configuration" {
    for_each = var.redirect_listener
    content {
      name                 = "${redirect_configuration.value.name}Redirect"
      redirect_type        = "Permanent"
      target_url           = redirect_configuration.value.target_url
      target_listener_name = redirect_configuration.value.target_listener_name
      include_path         = true
      include_query_string = true
    }
  }

  # --- http/https listener

  dynamic "http_listener" {
    for_each = var.http_listener
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = "appGatewayFrontendIP"
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
      ssl_certificate_name           = coalesce(http_listener.value.ssl_certificate_name, var.default_ssl_certificate_name)
      host_names                     = length(http_listener.value.host_names) > 0 ? http_listener.value.host_names : null
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.http_listener
    content {
      name                       = "${request_routing_rule.value.name}BasicRule"
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.name
      backend_address_pool_name  = request_routing_rule.value.backend_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_settings_name
    }
  }

  # --- backend settings

  dynamic "backend_http_settings" {
    for_each = var.backend_settings
    content {
      name                  = backend_http_settings.value.name
      cookie_based_affinity = "Disabled"
      port                  = backend_http_settings.value.port
      protocol              = coalesce(backend_http_settings.value.protocol, "Http")
      request_timeout       = backend_http_settings.value.request_timeout
      probe_name            = backend_http_settings.value.probe_name
      host_name             = backend_http_settings.value.host_name
    }
  }

  ## --- backend probes

  dynamic "probe" {
    for_each = var.backend_probes
    content {
      name                                      = probe.value.name
      host                                      = probe.value.pick_host_name_from_backend_settings ? null : probe.value.host_name
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_settings
      path                                      = coalesce(probe.value.path, "/")
      protocol                                  = coalesce(probe.value.protocol, "Http")
      interval                                  = probe.value.interval
      timeout                                   = probe.value.timeout
      unhealthy_threshold                       = 2
      minimum_servers                           = 1
      match {
        status_code = probe.value.match.status_code
        body        = probe.value.match.body
      }
    }
  }

  # --- backend pool

  dynamic "backend_address_pool" {
    for_each = var.backend_pools
    content {
      name         = backend_address_pool.value.name
      ip_addresses = length(backend_address_pool.value.node_ips) > 0 ? backend_address_pool.value.node_ips : null
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

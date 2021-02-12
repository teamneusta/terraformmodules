## How to use the v002 module?

```
module "appgw" {
  source = "../../sharedmodules/application_gateway/v002"

  environment              = local.environment
  appgw_name               = "appgw"
  user_assigned_identities = [module.appgw_identity.data]
  public_ip                = module.appgw_ip.result
  subnet                   = module.subnets.data["appgw"]

  frontend_ports = [
    {
      name = "https"
      port = 443
    }
  ]

  http_listener = [
    {
      name                  = "dtor-s1_https"
      frontend_port_name    = "https"
      protocol              = "https"
      backend_pool_name     = "aks"
      backend_settings_name = "dtor-s1"
      ssl_certificate_name  = "wildcard-s1-dtor-azure-neusta-cloud"
      host_names            = ["*.dtor-s1.dieseltechnic.azure.neusta.cloud"]
    },
    {
      name                  = "dtor-s2_https"
      frontend_port_name    = "https"
      protocol              = "https"
      backend_pool_name     = "aks"
      backend_settings_name = "dtor-s2"
      ssl_certificate_name  = "wildcard-s1-dtor-azure-neusta-cloud"
      host_names            = ["*.dtor-s2.dieseltechnic.azure.neusta.cloud"]
    }
  ]

  backend_pools = [
    {
      name     = "aks"
      node_ips = [cidrhost(module.subnets.data["aks"].address_prefix, 510)]
    }
  ]

  backend_settings = [
    {
      name            = "dtor-s1"
      port            = 30800
      protocol        = "Http"
      request_timeout = 120
      host_name       = null
      probe_name      = "dtor-s1"
    },
    {
      name            = "dtor-s2"
      port            = 30800
      protocol        = "Http"
      request_timeout = 120
      host_name       = null
      probe_name      = "dtor-s2"
    }
  ]

  backend_probes = [
    {
      name                                 = "dtor-s1"
      host_name                            = "bus.dtor-s1.dieseltechnic.azure.neusta.cloud"
      pick_host_name_from_backend_settings = false
      path                                 = "/ping"
      protocol                             = "Http"
      interval                             = 60
      timeout                              = 15
      match = {
        status_code = ["100-999"]
        body        = null
      }
    },
    {
      name                                 = "dtor-s2"
      host_name                            = "bus.dtor-s2.dieseltechnic.azure.neusta.cloud"
      pick_host_name_from_backend_settings = false
      path                                 = "/ping"
      protocol                             = "Http"
      interval                             = 60
      timeout                              = 15
      match = {
        status_code = ["100-999"]
        body        = null
      }
    }
  ]

  ssl_certificate_secrets = [
    {
      name              = "wildcard-s1-dtor-azure-neusta-cloud"
      secret_identifier = "https://dtorkeyvault.vault.azure.net/secrets/wildcard-s1-dtor-azure-neusta-cloud/bdc1d5cfd8774279829cdf548c15b4ef"
    }
  ]

  log_analytics = var.log_analytics
}

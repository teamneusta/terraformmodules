## How to use the Module?

```
module "network" {
  source = "../../network"

  environment   = local.environment
  address_space = ["10.0.0.0/16"]
  subnets = [
    {
      name                      = "prod",
      address_prefix            = "10.0.0.0/25",
      network_security_group_id = "",
      service_endpoints         = ["Microsoft.Sql"]
    },
    {
      name                      = "prod-appgw",
      address_prefix            = "10.0.0.128/25",
      network_security_group_id = "",
      service_endpoints         = []
    }
  ]
}
```

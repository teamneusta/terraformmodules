# Example for Neusta VPN

Das Subnet **muss** GatewaySubnet heißen.

```
module "vpn_ip" {
  source            = "../sharedmodules/public_ip"

  environment       = local.environment
  resource_name     = "vpn-ip"
  domain_name_label = "${local.environment.project_name}-vpn"
}

module "neusta-is-vpn"{
  source              = "../sharedmodules/network_vpn"

  environment         = local.environment
  subnet              = module.network.data["GatewaySubnet"]
  public_ip           = module.vpn_ip.result
  connections = {
    neusta-is = {
      gateway_address     = "185.48.220.169"
      address_space       = ["10.131.0.161/32","172.21.2.48/28","172.21.8.192/27","172.22.1.0/24"]
      shared_key          = "ag8lGJFosdjpf33hld"
      connection_protocol = "IKEv2"
    }
  }
}
```

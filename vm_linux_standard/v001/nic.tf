module "nic" {
  source = "../../vm_nic/v001"

  environment         = var.environment
  location            = var.location
  project_name        = var.project_name
  stage_name          = var.stage_name
  resource_group_name = var.resource_group_name
  resource_name       = "${local.resource_name}_nic0"

  subnet                 = var.subnet
  private_ip_address     = var.private_ip_address
  public_ip              = module.public_ip.result
  network_security_group = module.nsg.result

  log_analytics = var.log_analytics
}
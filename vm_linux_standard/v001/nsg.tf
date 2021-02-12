module "nsg" {
  source = "../../network_security_group/v002"

  environment         = var.environment
  location            = var.location
  project_name        = var.project_name
  stage_name          = var.stage_name
  resource_group_name = var.resource_group_name
  resource_name       = "${local.resource_name}_nsg"

  open_ports = var.nsg_open_ports
  rules      = var.nsg_rules
}

module "public_ip" {
  source = "../../public_ip/v001"

  environment         = var.environment
  location            = var.location
  project_name        = var.project_name
  stage_name          = var.stage_name
  resource_group_name = var.resource_group_name
  resource_name       = "${local.resource_name}_ip"

  ip_version        = var.public_ip_version
  allocation_method = var.public_ip_allocation_method
  domain_name_label = "${var.environment.project_name}-${var.environment.stage_name}-${var.vm_name}"

  log_analytics = var.log_analytics
}

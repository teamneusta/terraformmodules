module "availability_set" {
  source = "../../vm_availability_set/v001"

  environment         = var.environment
  location            = var.location
  project_name        = var.project_name
  stage_name          = var.stage_name
  resource_group_name = var.resource_group_name
  resource_name       = "${local.resource_name}_availabilitySet"

  fault_domain_count = 2
}
module "datadisks" {
  source = "../../vm_datadisks/v001"

  environment         = var.environment
  location            = var.location
  project_name        = var.project_name
  stage_name          = var.stage_name
  resource_group_name = var.resource_group_name
  resource_name       = "${local.resource_name}_DataDisk"

  disk_type     = var.data_disk_type
  disk_sizes_gb = var.data_disk_sizes_gb

  log_analytics = var.log_analytics
}
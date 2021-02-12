module "vm" {
  source = "../../vm_linux/v002"

  environment         = var.environment
  location            = var.location
  project_name        = var.project_name
  stage_name          = var.stage_name
  resource_group_name = var.resource_group_name
  resource_name       = var.resource_name

  vm_name                  = var.vm_name
  vm_size                  = var.vm_size
  os_disk_size_gb          = var.os_disk_size_gb
  os_disk_type             = var.os_disk_type
  os_disk_caching          = var.os_disk_caching
  admin_username           = var.admin_username
  ssh_public_key           = var.ssh_public_key
  computer_name            = var.computer_name
  source_image_reference   = var.source_image_reference
  data_disk_caching        = var.data_disk_caching
  user_assigned_identities = var.user_assigned_identities
  system_assigned_identity = var.system_assigned_identity

  availability_set          = module.availability_set.data
  primary_network_interface = module.nic.data
  data_disks                = module.datadisks.data

  log_analytics                = var.log_analytics
  diagnostics_storage          = var.diagnostics_storage
  enable_diagnostics_extension = var.enable_diagnostics_extension
  enable_omsagent_extension    = var.enable_omsagent_extension
  enable_puppet_extension      = var.enable_puppet_extension
  provision_vm_agent           = var.provision_vm_agent

  tags = var.tags
}

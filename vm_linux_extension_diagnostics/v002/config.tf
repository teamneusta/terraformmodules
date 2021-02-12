data "template_file" "config" {
  template = file("${path.module}/templates/diag_config_3.0.json")

  vars = {
    vm_id            = var.vm.id
    storage_account  = var.diagnostics_storage.name
    log_level_config = var.syslog_log_level_config
  }
}
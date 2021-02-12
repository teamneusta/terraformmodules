data "template_file" "config" {
  count = var.enable_extension ? 1 : 0

  template = file("${path.module}/templates/wadcfg.xml")

  vars = {
    vm_id           = var.vm.id
    storage_account = var.diagnostics_storage.name
  }
}
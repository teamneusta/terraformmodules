data "template_file" "config" {
  template = file("${path.module}/templates/wadcfg.xml")

  vars = {
    vm_id           = var.vm.id
    storage_account = var.diagnostics_storage.name
  }
}
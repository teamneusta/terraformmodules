data "template_file" "config" {
  template = file("${path.module}/templates/puppet-agent.sh")

  vars = {
    vm_id        = var.vm.id
    vm_name      = var.vm.name
    host_name    = var.vm.computer_name
    project_name = var.environment.project_name
    stage_name   = var.environment.stage_name
  }
}
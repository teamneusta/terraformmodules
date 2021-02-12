locals {
  location            = var.location != "*" ? var.location : var.environment.location
  project_name        = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.environment.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.environment.resource_group_name

  resource_name_prefix = trim("${local.project_name}-${local.stage_name}", "-")
  resource_name        = var.resource_name != "" ? var.resource_name : trim("${local.resource_name_prefix}-${var.vm_name}", "-")

  computer_name  = var.computer_name != "" ? var.computer_name : substr(replace(var.vm_name != "" ? var.vm_name : var.resource_name, "-", ""), 0, 15)
  admin_password = var.admin_password != "" ? var.admin_password : random_password.admin.result
}
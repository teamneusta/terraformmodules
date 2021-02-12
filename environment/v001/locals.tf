locals {
  location            = var.location != "*" ? var.location : var.parent.location
  project_name        = var.project_name != "*" ? var.project_name : var.parent.project_name
  stage_name          = var.stage_name != "*" ? var.stage_name : var.parent.stage_name
  resource_group_name = var.resource_group_name != "*" ? var.resource_group_name : var.parent.resource_group_name

  defaults = {
    service_principal_client_id = ""
  }
}

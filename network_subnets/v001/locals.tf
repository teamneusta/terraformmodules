locals {
  project_name = var.project_name != "*" ? var.project_name : var.environment.project_name
  stage_name   = var.stage_name != "*" ? var.stage_name : var.environment.stage_name

  subnet_name_prefix        = trim("${var.include_project_name ? local.project_name : ""}-${var.include_stage_name ? local.stage_name : ""}", "-")
  subnet_name_prefix_length = length(local.subnet_name_prefix) > 0 ? length(local.subnet_name_prefix) + 1 : 0
}

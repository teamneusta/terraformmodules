# Generate a new id each time we switch to a new resource group
resource "random_id" "loganalytics_workspace" {
  keepers = {
    project_name        = local.project_name
    stage_name          = local.stage_name
    resource_group_name = local.resource_group_name
  }
  byte_length = 8
}
# Create a random password as client secret
resource "random_string" "defaultname" {
  keepers = {
    location            = local.location
    project_name        = local.project_name
    stage_name          = local.stage_name
    resource_group_name = local.resource_group_name
  }
  count = var.key_vault_name != "" || var.resource_name != "" ? 0 : 1

  length  = 24
  upper   = false
  lower   = true
  number  = false
  special = false
}
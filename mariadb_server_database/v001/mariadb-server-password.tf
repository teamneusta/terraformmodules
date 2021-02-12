# Create a random password as client secret
resource "random_password" "mariadb_server_password" {
  keepers = {
    location            = local.location
    project_name        = local.project_name
    stage_name          = local.stage_name
    resource_group_name = local.resource_group_name
    server_name         = local.server_name
  }
  length = 32
}
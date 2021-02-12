#How to use the Module?

module "resource_group" {
  source = "../SharedModules/resource_group"

  environment = module.environment.data
  resource_groups_name = "test"
}
#How to use the Module?

module "resource_groups" {
  source = "../SharedModules/resource_groups"

  environment = module.environment.data
  resource_groups = [
    {
      name     = "test1"
      location = "" # use the default location from the environment
    },
    {
      name     = "test2"
      location = "northeurope" # north europe
    }
  ]
}
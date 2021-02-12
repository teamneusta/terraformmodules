variable "loadbalancer" {
  type = object({
    id                  = string
    resource_group_name = string
  })
}

variable "backend_pools" {
  type = map(object({
    id = string
  }))
}

variable "probes" {
  type = map(object({
    id = string
  }))
}

variable "rules" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
    backend_pool_name       = string
    configuration_name      = string
    load_distribution       = string
    probe_name              = string
  }))
}

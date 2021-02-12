variable "loadbalancer" {
  type = object({
    id                  = string
    resource_group_name = string
  })
}

variable "nat_rules" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
  }))
}

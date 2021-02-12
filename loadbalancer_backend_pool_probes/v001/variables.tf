variable "loadbalancer" {
  type = object({
    id                  = string
    resource_group_name = string
  })
}

variable "probes" {
  type = list(object({
    name         = string
    protocol     = string
    backend_port = number
    request_path = string
  }))
}

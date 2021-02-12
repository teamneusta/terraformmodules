variable "network_security_group" {
  type = object({
    name                = string
    resource_group_name = string
  })
}

variable "rules" {
  type = list(object({
    priority                     = number
    name                         = string
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_ranges           = list(string)
    destination_port_ranges      = list(string)
    source_address_prefixes      = list(string)
    destination_address_prefixes = list(string)
  }))
  default = []
}

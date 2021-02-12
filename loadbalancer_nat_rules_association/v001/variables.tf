variable "nat_rules" {
  type = map(object({
    id = string
  }))
}

variable "nic" {
  type = object({
    id                 = string
    configuration_name = string
  })
}

variable "nat_rule" {
  type = object({
    id   = string
    name = string
  })
}

variable "nic" {
  type = object({
    id                 = string
    configuration_name = string
  })
}

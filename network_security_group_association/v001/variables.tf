variable "subnet" {
  type = object({
    id = string
  })
}

variable "network_security_group" {
  type = object({
    id = string
  })
}

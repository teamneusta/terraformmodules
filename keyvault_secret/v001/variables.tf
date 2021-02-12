variable "key_vault" {
  type = object({
    id = string
  })
}

variable "secret" {
  type = object({
    name  = string,
    value = string
  })
}

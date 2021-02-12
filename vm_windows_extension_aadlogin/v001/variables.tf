variable "vm" {
  type = object({
    id = string
  })
}

variable "enable_extension" {
  type    = bool
  default = true
}

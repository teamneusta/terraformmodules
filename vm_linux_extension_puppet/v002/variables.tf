variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "vm" {
  type = object({
    id            = string
    name          = string
    computer_name = string
  })
}

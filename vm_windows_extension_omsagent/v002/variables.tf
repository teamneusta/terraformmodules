variable "vm" {
  type = object({
    id = string
  })
}

variable "log_analytics" {
  type = object({
    id                 = string,
    workspace_id       = string,
    primary_shared_key = string
  })
}

variable "vm" {
  type = object({
    id = string
  })
}

variable "diagnostics_storage" {
  type = object({
    id                    = string
    name                  = string
    primary_access_key    = string
    primary_blob_endpoint = string
  })
}

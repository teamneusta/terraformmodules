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
  default = {
    id                    = ""
    name                  = ""
    primary_access_key    = ""
    primary_blob_endpoint = ""
  }
}

variable "enable_extension" {
  type    = bool
  default = true
}

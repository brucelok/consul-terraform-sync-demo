variable "hosted_zone_id" {
  type        = string
  default     = "Z0927126WG3RQ2EMMGY"
}

variable "dns_name" {
  type        = string
  default     = "api.bruce-lok.sbx.hashidemos.io"
}

# example from https://github.com/hashicorp/consul-terraform-sync/blob/main/examples/runnable-example/example-module/variables.tf
variable "services" {
  type = map(object({
    id                    = string
    name                  = string
    kind                  = string
    address               = string
    port                  = number
    meta                  = map(string)
    tags                  = list(string)
    namespace             = string
    status                = string
    node                  = string
    node_id               = string
    node_address          = string
    node_datacenter       = string
    node_tagged_addresses = map(string)
    node_meta             = map(string)
    cts_user_defined_meta = map(string)
  }))
  description = "Map of Consul service instances (injected by CTS)"
}

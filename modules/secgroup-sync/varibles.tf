variable "security_group_id" {
  type        = string
  description = "CTS secgroup"
  default     = "sg-0e2c0cf7c01f915fa"
}

variable "consul_kv" {
  type        = map(string)
  description = "Map of Consul KV paths (keys) to values (CIDRs) injected by CTS"
}

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

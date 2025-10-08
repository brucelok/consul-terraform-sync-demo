terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.14.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

variable "hosted_zone_id" {
  type        = string
  #default     = "xxxx"
}

variable "dns_name" {
  type        = string
  default     = "api.bruce-lok.sbx.hashidemos.io"
}

resource "aws_route53_record" "api" {
  count   = length(values(var.services)) > 0 ? 1 : 0
  zone_id = var.hosted_zone_id
  name    = var.dns_name
  type    = "A"
  ttl     = 300 
  records = [for s in values(var.services) : s.address]
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

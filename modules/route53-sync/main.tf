terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_route53_record" "api" {
  count   = length(values(var.services)) > 0 ? 1 : 0
  zone_id = var.hosted_zone_id
  name    = var.dns_name
  type    = "A"
  ttl     = 300 
  records = [for s in values(var.services) : s.address]
}

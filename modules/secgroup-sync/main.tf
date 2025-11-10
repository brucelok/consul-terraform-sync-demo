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

resource "aws_security_group_rule" "allowed_ingress" {
  for_each          = var.consul_kv

  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [each.value]
  security_group_id = var.security_group_id
  description       = "Allowed from ${split("/", each.key)[2]}"
}

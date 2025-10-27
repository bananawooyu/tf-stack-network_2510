# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "vpc" {
  source = "./vpc"

  inputs = {
    vpc_name = "stacks-ap-northeast-1-${var.default_tags.Environment}"
  }

  providers = {
    aws = provider.aws.this
  }
}

component "key_pair" {
  source = "./key_pair"

  providers = {
    aws = provider.aws.this
  }
}

# Remove old for_each instances
removed {
  from = component.vpc["ap-northeast-1"]

  lifecycle {
    destroy = true
  }
}

removed {
  from = component.key_pair["ap-northeast-1"]

  lifecycle {
    destroy = true
  }
}


output "vpc_id" {
  type        = string
  description = "VPC ID"
  value       = component.vpc.vpc_id
}

output "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs"
  value       = component.vpc.private_subnet_ids
}

output "security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
  value       = [component.vpc.security_group_id_ssh]
}

output "key_name" {
  type        = string
  description = "Key pair name"
  value       = component.key_pair.key_name
}

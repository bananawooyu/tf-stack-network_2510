# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "vpc" {
  source   = "./vpc"
  for_each = var.regions

  inputs = {
    vpc_name = "stacks-${each.value}-${var.default_tags.Environment}"
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}

component "key_pair" {
  source   = "./key_pair"

  providers = {
    aws = provider.aws.this[each.value]
  }
}


output "vpc_ids" {
  type        = map(string)
  description = "VPC IDs by region"
  value       = { for region, vpc in component.vpc : region => vpc.vpc_id }
}

output "private_subnet_ids" {
  type        = map(list(string))
  description = "Private subnet IDs by region"
  value       = { for region, vpc in component.vpc : region => vpc.private_subnet_ids }
}

output "security_group_ids" {
  type        = map(list(string))
  description = "Security group IDs by region"
  value       = { for region, vpc in component.vpc : region => [vpc.security_group_id_ssh] }
}

output "key_names" {
  type        = map(string)
  description = "Key pair names by region"
  value       = component.key_pair.key_name
}
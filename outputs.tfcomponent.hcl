# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

publish_output "vpc_ids" {
  description = "VPC IDs by region"
  value       = { for region, vpc in component.vpc : region => vpc.vpc_id }
}

publish_output "private_subnet_ids" {
  description = "Private subnet IDs by region"
  value       = { for region, vpc in component.vpc : region => vpc.private_subnet_ids }
}

publish_output "security_group_ids" {
  description = "Security group IDs by region"
  value       = { for region, vpc in component.vpc : region => [vpc.security_group_id_ssh] }
}

publish_output "key_names" {
  description = "Key pair names by region"
  value       = { for region, key in component.key_pair : region => key.key_name }
}
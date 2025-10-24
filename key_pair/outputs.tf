# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "key_name" {
  description = "Name of the AWS key pair."
  value       = data.aws_key_pair.existing.key_name
}

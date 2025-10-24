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
  for_each = var.regions

  providers = {
    aws = provider.aws.this[each.value]
  }
}

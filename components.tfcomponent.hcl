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

# Remove the old ap-northeast-2 vpc component
removed {
  from = component.vpc["ap-northeast-2"]

  lifecycle {
    destroy = true
  }
}

component "key_pair" {
  source   = "./key_pair"
  for_each = var.regions

  providers = {
    aws = provider.aws.this[each.value]
  }
}

# Remove the old ap-northeast-2 key pair component
removed {
  from = component.key_pair["ap-northeast-2"]

  lifecycle {
    destroy = true
  }
}

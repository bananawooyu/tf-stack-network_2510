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

# # Remove old for_each instances
# removed {
#   source = "./vpc"
#   from   = component.vpc["ap-northeast-1"]
  
#   providers = {
#     aws = provider.aws.this
#   }
# }

# removed {
#   source = "./key_pair"
#   from   = component.key_pair["ap-northeast-1"]
  
#   providers = {
#     aws = provider.aws.this
#   }
# }


output "networks_output" {
  description = "VPC and networks with key_pair for dev environment"
  type = object({
    vpc_id             = string
    private_subnet_ids = list(string)
    security_group_ids = string
    key_name           = string
  })
  value = {
      vpc_id             = component.vpc.vpc_id
      private_subnet_ids = component.vpc.private_subnet_ids
      security_group_ids = component.vpc.security_group_id_ssh
      key_name           = component.key_pair.key_name
  }
}
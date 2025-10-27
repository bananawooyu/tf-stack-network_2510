# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# identity_token "aws" {
#   audience = ["aws.workload.identity"]
# }

store "varset" "aws_creds" {
  id       = "varset-YecpES2hy9E5tUSw"
  category = "env"
}

deployment "development" {
  inputs = {
    # role_arn       = store.varset.aws_creds.AWS_ROLE_ARN
    # identity_token = identity_token.aws.jwt
    access_key = store.varset.aws_creds.AWS_ACCESS_KEY_ID
    secret_key = store.varset.aws_creds.AWS_SECRET_ACCESS_KEY
    default_tags = {
      Stack       = "tf-stack-network_2510",
      Environment = "dev"
    }
  }
}

publish_output "vpc_ids" {
  description = "VPC IDs by region"
  value       = { for region, vpc in deployment.development.vpc : region => vpc.vpc_id }
}

publish_output "private_subnet_ids" {
  description = "Private subnet IDs by region"
  value       = { for region, vpc in deployment.development.vpc : region => vpc.private_subnet_ids }
}

publish_output "security_group_ids" {
  description = "Security group IDs by region"
  value       = { for region, vpc in deployment.development.vpc : region => vpc.security_group_ids }
}

publish_output "key_names" {
  description = "Key pair names by region"
  value       = deployment.development.key_names
}

# deployment "production" {
#   inputs = {
#     regions = ["ap-northeast-1"]
#     # role_arn       = store.varset.aws_creds.AWS_ROLE_ARN
#     # identity_token = identity_token.aws.jwt
#     access_key = store.varset.aws_creds.AWS_ACCESS_KEY_ID
#     secret_key = store.varset.aws_creds.AWS_SECRET_ACCESS_KEY
#     default_tags = {
#       Stack       = "tf-stack-network_2510",
#       Environment = "prod"
#     }
#   }
# }

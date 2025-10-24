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
    regions        = ["ap-northeast-2"]
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

deployment "production" {
  inputs = {
    regions        = ["ap-northeast-2"]
    # role_arn       = store.varset.aws_creds.AWS_ROLE_ARN
    # identity_token = identity_token.aws.jwt
    access_key = store.varset.aws_creds.AWS_ACCESS_KEY_ID
    secret_key = store.varset.aws_creds.AWS_SECRET_ACCESS_KEY
    default_tags = {
      Stack       = "tf-stack-network_2510",
      Environment = "prod"
    }
  }
}

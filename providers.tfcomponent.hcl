# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 6.14.1"
  }
}

provider "aws" "this" {
  config {
    region = "ap-northeast-1"
    access_key = var.access_key
    secret_key = var.secret_key

    # assume_role_with_web_identity {
    #   role_arn           = var.role_arn
    #   web_identity_token = var.identity_token
    # }

    default_tags {
      tags = var.default_tags
    }
  }
}
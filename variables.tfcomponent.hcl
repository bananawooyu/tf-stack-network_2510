# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Single region deployment - ap-northeast-1 is hardcoded in providers

# variable "identity_token" {
#   description = "Identity token for authentication."
#   type        = string
#   ephemeral   = true
# }

# variable "role_arn" {
#   description = "ARN of role associated with identity token."
#   type        = string
# }

variable "access_key" {
  description = "AWS Access Key ID for authentication."
  type        = string
  ephemeral   = true
}

variable "secret_key" {
  description = "AWS Secret Access Key for authentication."
  type        = string
  ephemeral   = true
  sensitive   = true
}

variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default = {
    Stack       = "kal-stacks-deploy-aws",
    Environment = "dev"
  }
}

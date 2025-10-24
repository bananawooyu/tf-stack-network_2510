# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

data "aws_key_pair" "existing" {
  key_name = "pjh-ssh-tokyo"
}

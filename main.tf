terraform {
  required_version = ">=0.12.29"
  backend "s3" {
    region = "us-east-1"
    key    = "terraform_state_snippets"
    bucket = "terraform-state-rene"
  }
}

provider "aws" {
  version = "~> 3.22.0"
  profile = "default"
  region  = "us-east-1"
}

#create a locals variable to use, used the lower function to lowercase the user_id
locals {
  aws_account = "${data.aws_caller_identity.current.account_id}-${lower(data.aws_caller_identity.current.user_id)}"
}
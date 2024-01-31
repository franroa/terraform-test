terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "franroatestbucket"
    key            = "test"
    region         = "eu-west-1"
    dynamodb_table = "my-terraform-lock-table" # NOTE: we lock the state file on dynamodb to prevent concurrent writes. Also, that way we have backup
    encrypt        = true
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "default"
}

provider "github" {}

resource "github_membership" "membership_for_user_x" {
  username = "user_x"
}

# change

# Add a user to the organization
# resource "github_membership" "membership_for_user_x" { }

terraform {
  backend "s3" {
    bucket = "terraform-state-devopsthehardway-rf"
    key    = "eks-terraform-workernodes.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
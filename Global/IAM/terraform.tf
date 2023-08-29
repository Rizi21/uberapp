terraform {
  backend "s3" {
    bucket = "terraform-state-devopsthehardway-rf"
    key    = "eks-terraform-IAM-roles.tfstate"
    region = "us-east-1"
  }
}
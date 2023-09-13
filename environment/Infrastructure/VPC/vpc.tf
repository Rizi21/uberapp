module "vpc" {
  source = "../../../modules/VPC"

  stack_name = "eks"
}
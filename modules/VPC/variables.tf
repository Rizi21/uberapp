variable "vpc_block" {
  default = "192.168.0.0/16"
}

variable "stack_name" {
  type = string
}

variable "public_subnet01_block" {
  default = "192.168.0.0/18"
}

variable "public_subnet02_block" {
  default = "192.168.64.0/18"
}

variable "private_subnet01_block" {
  default = "192.168.128.0/18"
}

variable "private_subnet02_block" {
  default = "192.168.192.0/18"
}
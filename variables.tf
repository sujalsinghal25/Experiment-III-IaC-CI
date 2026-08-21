variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

# No default on purpose — you must set this in terraform.tfvars.
# Find your IP with: curl -s https://checkip.amazonaws.com
variable "admin_cidr" {
  type = string
}

variable "ami_id" {
  description = "AMI id for your region (Amazon Linux 2023 recommended)"
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "web_count" {
  type    = number
  default = 2
}

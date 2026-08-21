variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public (web) subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private (db) subnet"
  type        = string
}

variable "availability_zone" {
  description = "AZ to place both subnets in"
  type        = string
}

variable "admin_cidr" {
  description = "Your machine's public IP in CIDR form, e.g. 203.0.113.7/32 — used to restrict SSH"
  type        = string
}

variable "project_name" {
  description = "Prefix used for tagging"
  type        = string
  default     = "lab2"
}

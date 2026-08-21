variable "ami_id" {
  description = "AMI to launch (e.g. latest Amazon Linux 2023 for your region)"
  type        = string
}

variable "instance_type" {
  description = "Instance type for web and db instances"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair (never the key file itself)"
  type        = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "web_sg_id" {
  type = string
}

variable "db_sg_id" {
  type = string
}

variable "web_count" {
  description = "Number of web-tier instances"
  type        = number
  default     = 2
}

variable "project_name" {
  type    = string
  default = "lab2"
}

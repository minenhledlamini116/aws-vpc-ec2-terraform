variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used to name every resource"
  type        = string
  default     = "secure-web-vpc"
}

variable "vpc_cidr" {
  description = "IP range for the whole VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "IP range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "IP range for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 size. t3.micro is free tier eligible on newer accounts, use t2.micro on older ones"
  type        = string
  default     = "t3.micro"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR form, for example 203.0.113.25/32. Used to lock down SSH"
  type        = string
}

variable "key_pair_name" {
  description = "Optional name of an existing EC2 key pair for SSH. Leave empty to skip SSH"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Short project name used in resource naming"
  type        = string
  default     = "autoheal-web"
}

variable "environment" {
  description = "Deployment environment label"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner tag for cost and ownership tracking"
  type        = string
  default     = "xmopher"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

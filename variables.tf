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

variable "instance_type" {
  description = "EC2 instance type for the web tier"
  type        = string
  default     = "t3.micro"
}

variable "desired_capacity" {
  description = "Desired ASG capacity (N+1 => at least 2)"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum ASG size"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum ASG size"
  type        = number
  default     = 4
}

variable "docker_image" {
  description = "Container image for the web tier"
  type        = string
  default     = "nginx:alpine"
}

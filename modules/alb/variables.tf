variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "subnet_ids" {
  description = "Public subnet IDs for the ALB (at least two AZs)"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID attached to the ALB"
  type        = string
}

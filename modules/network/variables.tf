variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of availability zones / public subnets (min 2 for ALB)"
  type        = number
  default     = 2

  validation {
    condition     = var.az_count >= 2
    error_message = "At least 2 AZs are required for a highly available ALB."
  }
}

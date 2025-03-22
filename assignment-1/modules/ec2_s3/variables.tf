variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

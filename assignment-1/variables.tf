variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}
variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

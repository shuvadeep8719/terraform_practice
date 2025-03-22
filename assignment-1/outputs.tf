output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_s3.ec2_public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.ec2_s3.s3_bucket_name
}

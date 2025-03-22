resource "aws_instance" "web" {
  instance_type          = var.instance_type
  count                  = var.instance_count
  ami                    = var.ami_id
  subnet_id              = var.subnet_id
  key_name               = "my-ec2-key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_s3_profile.name

  tags = {
    Name = "${var.environment}-web-instance-${count.index}"
  }

}

resource "aws_s3_bucket" "web_bucket" {
  bucket = "${var.environment}-my-app-bucket"
  # Enable ACLs (if required)
  # object_ownership = "ObjectWriter"
  # This is because S3 Bucket ACLs are disabled by default in many AWS accounts and regions.
  tags = {
    Name        = "MyBucket-${terraform.workspace}"
    Environment = terraform.workspace
  }
}

# resource "aws_s3_bucket_acl" "this" {
#   bucket = aws_s3_bucket.web_bucket.id
#   acl    = "private"
# }

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.web_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource  = [aws_s3_bucket.web_bucket.arn, "${aws_s3_bucket.web_bucket.arn}/*"]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.web_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_iam_role" "ec2_s3_role" {
  name = "${var.environment}-ec2-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "ec2_s3_policy" {
  name = "${var.environment}-ec2-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["s3:*"],
        Resource = [
          "arn:aws:s3:::my-task-${terraform.workspace}",
          "arn:aws:s3:::my-task-${terraform.workspace}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_s3_profile" {
  name = "${var.environment}-ec2-s3-profile"
  role = aws_iam_role.ec2_s3_role.name
}

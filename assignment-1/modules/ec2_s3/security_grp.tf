resource "aws_security_group" "web_sg" {
  name        = "${var.environment}-web-sg"
  description = "Security group for EC2 allowing limited access"

  # Ingress: Allow SSH from all IP
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ] # Replace YOUR_IP with your actual IP
  }

  # Ingress: Allow HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress: Allow outbound traffic ONLY to my IP
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ] # Replace YOUR_IP
  }

  tags = {
    Name = "${var.environment}-web-sg"
  }
}

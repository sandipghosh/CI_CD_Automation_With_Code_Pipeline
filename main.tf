
resource "aws_instance" "simple_ec2_instance" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.ec2_instance_type

  user_data = <<-EOF
              sudo apt update -y
              sudo apt install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello viewers" > /var/www/html/index.html
              EOF

  metadata_options {
    http_tokens                 = "required" # require IMDSv2
    http_endpoint               = "enabled"  # optional (enabled/disabled)
    http_put_response_hop_limit = 1
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs.arn # optional: use your CMK
  }

  tags = {
    Name = "ec2 instance created througt code pipeline automation"
  }
}

resource "aws_kms_key" "ebs" {
  description             = "KMS key for EBS encryption"
  enable_key_rotation     = true
  rotation_period_in_days = 90
}

resource "aws_ebs_encryption_by_default" "default" {
  enabled = true
}
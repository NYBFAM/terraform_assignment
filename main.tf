#creation of ec2 instance.
resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name
  }
}
#creating of s3 bucket for storage.
resource "aws_s3_bucket" "this-is-my-official-bucket" {
  bucket = var.bucket_name
  lifecycle {
    prevent_destroy = true
  }
}
#creating of s3 bucket versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = var.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

#creating of kms to encrupt the s3 bucket backend.
resource "aws_kms_key" "a" {
  description             = "Terraform kms key for encryption"
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "a" {
  name          = "alias/tfstate/${var.region}/s3/key"
  target_key_id = aws_kms_key.a.key_id
}

# creation of aws_dynamodb for locking the state file.
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  deletion_protection_enabled = var.delete_protect

  tags = {
    Name = var.dynamo_table
  }
}

#creation of security group for our ec2 instance
resource "aws_security_group" "allow_tls" {
  name        = var.name_sg
  vpc_id = var.vpc_id
  description = var.description

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["116.30.20.50/32"]

  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["116.30.20.50/32"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["116.30.20.50/32"]
  }

  tags = {
    Name = var.tags
  }
}



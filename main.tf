resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name
  }
}
resource "aws_s3_bucket" "this-is-my-official-bucket" {
  bucket = var.bucket_name
}

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = var.bucket_name
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
# //s3 bucket for storage
# // kms key for encryption
# resource "aws_kms_key" "a" {
#   description = "Terraform kms key for encryption"
# }

# resource "aws_kms_alias" "a" {
#   name          = "alias/Terraform_exercise2/tfstate/${var.region}/s3/key"
#   target_key_id = aws_kms_key.a.key_id
# }

# // dynamodb for locking the state file 
# resource "aws_dynamodb_table" "basic-dynamodb-table" {
#   name         = var.table_name
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   tags = {
#     Name        = "dynamodb-table-1"
#     Environment = var.Environment
#   }
# }




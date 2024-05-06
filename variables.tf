variable "region" {
  description = "this is the region where the resource will be deployed"
  type        = string
  default     = "us-east-1"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "name" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "dev"
}
variable "subnet_id" {
  description = "subnet for the EC2 instance"
  type        = string
  default     = "subnet-01c10b8cb9cf99a68"
}
variable "bucket_name" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "this-is-my-official-bucket"
}

variable "deletion_window_in_days" {
  description = "this my deletion window for my kms"
  type        = number
  default     = 20
}
variable "delete_protect" {
  description = "this is to protect the dynamodb from being deleted"
  type        = bool
  default     = true
}

variable "table_name" {
  description = "Name of my dynamodb table"
  type        = string
  default     = "lock-terraform-state-db"
}

variable "dynamo_table" {
  description = "tag name of my dynamo table"
  type        = string
  default     = "dynamodb-table-stafe-file"

}
variable "name_sg" {
  description = "name of our security group for our ec2"
  type        = string
  default     = "Allow_tls"
}
variable "vpc_id" {
  description = "this is my vpc-id for security group for our ec2"
  type        = string
  default     ="vpc-0862772f98e13daf4"
}
variable "description" {
  description = "this is the decription for our security group"
  type        = string
  default     = "Allow TLS inbound traffic"
}

variable "tags" {
  description = "tag name for our ingress"
  type        = string
  default     = "manual"
}
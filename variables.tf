
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
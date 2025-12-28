variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "ami_id" {
  description = "AMİ ID for EC2"
  type        = string
}


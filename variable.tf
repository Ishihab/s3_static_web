
# AWS Provider Configuration Variables
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default = "us-east-1"
}

variable "aws_profile" {
  description = "The AWS CLI profile to use for authentication"
  type        = string
}

# s3 bucket configuration variables
variable "aws_s3_bucket_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = string
  default     = "Enabled"
  
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Environment = "Dev"
    Project     = "S3StaticWebsite"
  }
  
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = "my-static-website-"
  
}

variable "bucket_region" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
  
}
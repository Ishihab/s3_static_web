provider "aws" {
  region = var.aws_region
  # Profile is optional - if not set, will use environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
  profile = var.aws_profile != "" ? var.aws_profile : null
}


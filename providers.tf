
provider "aws" {
  region = var.aws_region
  shared_config_files = ["~/.aws/credentials"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile = var.aws_profile
}


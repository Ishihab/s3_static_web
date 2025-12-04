terraform {
  backend "s3" {
    bucket = "terraform-remotestate-dockyard43526"
    key    = "s3_static_web/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
# AWS Credentials Configuration Guide

This project supports two methods for AWS authentication:

## Method 1: Local Development (AWS Profile)

### Setup
1. Ensure your AWS credentials are configured in `~/.aws/credentials`:
```ini
[terraform_dockyard]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY
```

2. Set the profile in `terraform.tfvars`:
```hcl
aws_profile = "terraform_dockyard"
```

3. Initialize Terraform with the local backend config:
```bash
terraform init -backend-config=backend.local.hcl
```

4. Run Terraform commands normally:
```bash
terraform plan
terraform apply
```

## Method 2: GitHub Actions (Environment Variables)

### Setup
1. Add secrets to your GitHub repository:
   - Go to: **Settings** → **Secrets and variables** → **Actions**
   - Add `AWS_ACCESS_KEY_ID`
   - Add `AWS_SECRET_ACCESS_KEY`

2. In `terraform.tfvars`, leave aws_profile empty or set to empty string:
```hcl
aws_profile = ""
```

3. GitHub Actions will automatically use the environment variables set in the workflow file:
```yaml
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

4. Terraform init in GitHub Actions doesn't need backend config file:
```bash
terraform init  # No backend-config needed, uses env vars
```

## How It Works

### Provider Configuration
The `providers.tf` uses a conditional to support both methods:
```hcl
provider "aws" {
  region = var.aws_region
  # If profile is set, use it; otherwise use environment variables
  profile = var.aws_profile != "" ? var.aws_profile : null
}
```

### Backend Configuration
The `backend.tf` doesn't specify a profile by default:
```hcl
terraform {
  backend "s3" {
    bucket = "terraform-remotestate-dockyard43526"
    key    = "s3_static_web/terraform.tfstate"
    region = "us-east-1"
    # No profile here - can be added via backend-config file
  }
}
```

For local development, use `backend.local.hcl` (gitignored):
```hcl
profile = "terraform_dockyard"
```

## Summary

| Environment | Profile Setting | Backend Init Command | AWS Auth Method |
|-------------|----------------|----------------------|-----------------|
| **Local** | Set in tfvars | `terraform init -backend-config=backend.local.hcl` | AWS Profile |
| **GitHub Actions** | Empty or not set | `terraform init` | Environment Variables |

## Files
- `backend.local.hcl` - Local backend config (gitignored)
- `terraform.tfvars` - Your local variable values (gitignored)
- `.github/workflows/terraform.yml` - GitHub Actions workflow with env vars

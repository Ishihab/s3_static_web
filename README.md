# S3 Static Website with CloudFront

Deploy a static website to AWS S3 with CloudFront CDN using Terraform and GitHub Actions.

## What This Does

- Creates an S3 bucket configured for static website hosting
- Sets up CloudFront distribution for fast global content delivery
- Automatically uploads your website files from the `www/` directory
- Includes CI/CD pipeline for automated deployments

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.4
- AWS account with appropriate permissions
- AWS CLI configured (`aws configure`)

## Quick Start

1. **Clone and configure:**
   ```bash
   git clone <repository-url>
   cd s3_static_website
   cp terraform.tfvars.sample terraform.tfvars
   ```

2. **Edit `terraform.tfvars`** with your settings:
   ```hcl
   aws_region = "us-east-1"
   bucket_prefix = "my-site-"
   aws_s3_bucket_versioning = "Enabled"
   ```

3. **Update `backend.tf`** with your state bucket:
   ```hcl
   bucket = "your-terraform-state-bucket"
   ```

4. **Deploy:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

5. **Access your site** using the CloudFront URL from the output.

## Project Structure

```
├── .github/workflows/
│   ├── terraform.yml      # CI/CD deployment pipeline
│   └── destroy.yml        # Infrastructure teardown
├── www/                   # Your website files go here
│   ├── index.html
│   ├── error.html
│   ├── style.css
│   └── script.js
├── s3.tf                  # S3 bucket configuration
├── cloudfront.tf          # CloudFront distribution
├── variable.tf            # Input variables
└── terraform.tfvars       # Your values (gitignored)
```

## Deployment Options

### Option 1: Automated (GitHub Actions)

1. Add GitHub Secrets in your repository settings:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

2. Push to `main` branch:
   ```bash
   git add .
   git commit -m "Deploy website"
   git push origin main
   ```

The GitHub Actions workflow automatically:
- Validates and formats Terraform code
- Plans infrastructure changes
- Applies changes on push to main

### Option 2: Manual

```bash
terraform apply
```

## Updating Your Website

**With GitHub Actions:**
1. Edit files in `www/` directory
2. Commit and push to main branch

**Manual:**
1. Edit files in `www/` directory
2. Run `terraform apply`

Terraform automatically detects and uploads only changed files.

## Configuration Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region | `us-east-1` |
| `bucket_prefix` | S3 bucket name prefix | `my-static-website-` |
| `aws_s3_bucket_versioning` | Enable versioning | `Enabled` |
| `bucket_region` | S3 bucket region | `us-east-1` |
| `tags` | Resource tags | See variable.tf |

## Outputs

After deployment, you'll get:
- `website_endpoint` - Direct S3 website URL
- `cdn_domain_name` - CloudFront URL (recommended for production)

## Cleanup

To remove all resources:
```bash
terraform destroy
```

## Troubleshooting

**Bucket name already exists:** Change `bucket_prefix` to something unique.

**CloudFront not showing updates:** Wait for cache TTL (up to 24h) or create an invalidation:
```bash
aws cloudfront create-invalidation --distribution-id <ID> --paths "/*"
```

**GitHub Actions failing:** Verify AWS secrets are correctly set and IAM permissions are sufficient.

## Security Notes

- Never commit `terraform.tfvars` or AWS credentials
- Store AWS credentials in GitHub Secrets for CI/CD
- The S3 bucket allows public read access (required for static websites)
- CloudFront provides HTTPS by default

## License

See [LICENSE](LICENSE) file for details.

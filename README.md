# S3 Static Website with CloudFront CDN

This Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery.

## 🏗️ Architecture

The infrastructure includes:
- **S3 Bucket**: Hosts static website files with public read access
- **CloudFront Distribution**: CDN for faster global content delivery
- **Remote State Backend**: S3 backend for remote state storage
- **Versioning**: S3 bucket versioning enabled by default

## 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- AWS Account with appropriate permissions
- AWS CLI configured with credentials
- An existing S3 bucket for Terraform remote state storage

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/Ishihab/s3_static_web.git
cd s3_static_website
```

### 2. Configure Backend

Edit `backend.tf` with your remote state configuration:

```hcl
terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "s3_static_web/terraform.tfstate"
    region = "us-east-1"
    profile = "your-aws-profile"
    use_lockfile = true
  }
}
```

> **Note**: Update the `bucket`, `region`, and `profile` values to match your AWS environment.

### 3. Configure Variables

Copy the sample tfvars file and update with your values:

```bash
cp terraform.tfvars.sample terraform.tfvars
```

Edit `terraform.tfvars` with your AWS profile:

```hcl
aws_profile = "your-aws-profile-name"
```

### 4. Initialize Terraform

```bash
terraform init
```

### 5. Review the Plan

```bash
terraform plan
```

### 6. Deploy the Infrastructure

```bash
terraform apply
```

Type `yes` when prompted to confirm the deployment.

## 📁 Project Structure

```
.
├── backend.tf                    # Remote state backend configuration
├── cloudfront.tf                 # CloudFront CDN distribution
├── providers.tf                  # AWS provider configuration
├── s3.tf                         # S3 bucket and website configuration
├── variable.tf                   # Variable definitions
├── terraform.tfvars.sample       # Sample variables file
├── terraform.tfvars              # Your local configuration (gitignored)
└── www/                          # Website content directory
    ├── index.html                # Homepage
    ├── error.html                # Error page
    ├── style.css                 # Stylesheets
    └── script.js                 # JavaScript files
```

## 🔧 Configuration Variables

### Required Variables

| Variable | Description |
|----------|-------------|
| `aws_profile` | AWS CLI profile name for authentication |

### Optional Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `aws_region` | `us-east-1` | AWS region for resource deployment |
| `bucket_prefix` | `my-static-website-` | Prefix for the S3 bucket name |
| `bucket_region` | `us-east-1` | Region for the website S3 bucket |
| `aws_s3_bucket_versioning` | `Enabled` | Enable/disable S3 versioning |
| `tags` | See below | Resource tags |

Default tags:
```hcl
tags = {
  Environment = "Dev"
  Project     = "S3StaticWebsite"
}
```

## 📤 Outputs

After deployment, Terraform outputs:

- **website_endpoint**: Direct S3 website endpoint URL
- **cdn_domain_name**: CloudFront distribution domain name (recommended)

Access your website at: `https://<cdn_domain_name>`

## 🌐 Adding/Updating Website Content

1. Place your static files in the `www/` directory
2. Run `terraform apply` to sync changes to S3

Supported file types are automatically detected:
- HTML, CSS, JavaScript
- Images (PNG, JPG, GIF)

## 🔒 Security Features

- S3 bucket public access configured for website hosting
- Bucket policy allows public read access to objects
- CloudFront uses HTTPS for secure content delivery
- State file stored securely in S3 remote backend
- Sensitive configuration (`terraform.tfvars`) is gitignored

## 🗑️ Cleanup

To destroy all resources:

```bash
terraform destroy
```

Type `yes` when prompted to confirm resource deletion.

## 📝 Notes

- The S3 bucket name is automatically generated using the `bucket_prefix` variable
- CloudFront distribution deployment may take 15-20 minutes
- Website files are automatically uploaded from the `www/` directory
- Content-Type headers are automatically set based on file extensions
- Before using this project, update `backend.tf` with your own S3 bucket and AWS profile
- The backend configuration is committed to the repository for consistency

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

See [LICENSE](LICENSE) file for details.

## ⚠️ Important Reminders

- **Update `backend.tf`** with your own S3 bucket for remote state before running `terraform init`
- Never commit `terraform.tfvars` with sensitive credentials (it is gitignored)
- Ensure your AWS credentials have sufficient permissions
- CloudFront distributions incur charges even when idle
- Review AWS pricing before deployment

## 🆘 Troubleshooting

### Issue: Terraform init fails with backend errors
**Solution**: 
- Verify the S3 bucket specified in `backend.tf` exists and is accessible
- Ensure your AWS profile has permissions to access the S3 bucket
- Check that the profile name in `backend.tf` matches your AWS CLI configuration

### Issue: Access denied errors
**Solution**: Check your AWS profile permissions and ensure the IAM user has required policies for S3, CloudFront, and IAM operations.

### Issue: CloudFront not serving content
**Solution**: Wait 15-20 minutes for distribution deployment to complete. Check CloudFront console for status.

## 📚 Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [CloudFront Documentation](https://docs.aws.amazon.com/cloudfront/)

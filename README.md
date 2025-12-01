# S3 Static Website with CloudFront CDN

This Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery.

## 🏗️ Architecture

The infrastructure includes:
- **S3 Bucket**: Hosts static website files with public read access
- **CloudFront Distribution**: CDN for faster global content delivery
- **Remote State Backend**: S3 backend with DynamoDB state locking
- **Versioning**: S3 bucket versioning enabled by default

## 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- AWS Account with appropriate permissions
- AWS CLI configured with credentials
- An existing S3 bucket for Terraform remote state
- A DynamoDB table for state locking

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd s3_static_website
```

### 2. Configure Variables

Copy the sample tfvars file and update with your values:

```bash
cp terraform.tfvars.sample terraform.tfvars
```

Edit `terraform.tfvars` with your configuration:

```hcl
aws_profile = "your-aws-profile-name"
remote_backend_bucket = "your-terraform-state-bucket"
remote_backend_region = "us-east-1"
remote_backend_dynamodb_table = "your-dynamodb-table-name"
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the Plan

```bash
terraform plan
```

### 5. Deploy the Infrastructure

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
├── terraform.tfvars              # Your local configuration (not tracked)
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
| `remote_backend_bucket` | S3 bucket name for storing Terraform state |
| `remote_backend_region` | AWS region for the state bucket |
| `remote_backend_dynamodb_table` | DynamoDB table for state locking |

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
- State file stored securely in S3 with DynamoDB locking

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

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

See [LICENSE](LICENSE) file for details.

## ⚠️ Important Reminders

- Never commit `terraform.tfvars` with sensitive credentials
- Ensure your AWS credentials have sufficient permissions
- CloudFront distributions incur charges even when idle
- Review AWS pricing before deployment

## 🆘 Troubleshooting

### Issue: Terraform init fails
**Solution**: Verify your remote backend S3 bucket and DynamoDB table exist and are accessible.

### Issue: Access denied errors
**Solution**: Check your AWS profile permissions and ensure the IAM user has required policies.

### Issue: CloudFront not serving content
**Solution**: Wait 15-20 minutes for distribution deployment to complete. Check CloudFront console for status.

## 📚 Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [CloudFront Documentation](https://docs.aws.amazon.com/cloudfront/)

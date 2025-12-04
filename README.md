# S3 Static Website with CloudFront CDN# S3 Static Website with CloudFront CDN



This Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery. The project uses AWS environment variables for authentication, making it work seamlessly in both local development and CI/CD environments.This Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery.



## 🏗️ Architecture## 🏗️ Architecture



The infrastructure includes:The infrastructure includes:

- **S3 Bucket**: Hosts static website files with public read access- **S3 Bucket**: Hosts static website files with public read access

- **CloudFront Distribution**: CDN for faster global content delivery- **CloudFront Distribution**: CDN for faster global content delivery

- **Remote State Backend**: S3 backend for remote state storage- **Remote State Backend**: S3 backend for remote state storage

- **Versioning**: S3 bucket versioning enabled by default- **Versioning**: S3 bucket versioning enabled by default

- **CI/CD Pipeline**: GitHub Actions workflow for automated deployments

## 📋 Prerequisites

## 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)- AWS Account with appropriate permissions

- AWS Account with appropriate permissions- AWS CLI configured with credentials

- AWS credentials configured as environment variables- An existing S3 bucket for Terraform remote state storage

- An existing S3 bucket for Terraform remote state storage

## 🚀 Quick Start

## 🔑 AWS Credentials Setup

### 1. Clone the Repository

This project uses **AWS environment variables** for authentication. This approach works identically in both local development and GitHub Actions CI/CD.

```bash

### Local Developmentgit clone https://github.com/Ishihab/s3_static_web.git

cd s3_static_website

Add these to your `~/.bashrc` or `~/.bash_profile`:```



```bash### 2. Configure Backend

export AWS_ACCESS_KEY_ID="your-access-key-id"

export AWS_SECRET_ACCESS_KEY="your-secret-access-key"Edit `backend.tf` with your remote state configuration:

export AWS_DEFAULT_REGION="us-east-1"

``````hcl

terraform {

Reload your shell:  backend "s3" {

```bash    bucket = "your-terraform-state-bucket"

source ~/.bashrc    key    = "s3_static_web/terraform.tfstate"

```    region = "us-east-1"

    profile = "your-aws-profile"

### GitHub Actions (CI/CD)    use_lockfile = true

  }

1. Go to your repository: **Settings** → **Secrets and variables** → **Actions**}

2. Add repository secrets:```

   - `AWS_ACCESS_KEY_ID`: Your AWS access key

   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key> **Note**: Update the `bucket`, `region`, and `profile` values to match your AWS environment.



The workflow file (`.github/workflows/terraform.yml`) automatically uses these secrets.### 3. Configure Variables



## 🚀 Quick StartCopy the sample tfvars file and update with your values:



### 1. Clone the Repository```bash

cp terraform.tfvars.sample terraform.tfvars

```bash```

git clone https://github.com/Ishihab/s3_static_web.git

cd s3_static_webEdit `terraform.tfvars` with your AWS profile:

```

```hcl

### 2. Configure Backendaws_profile = "your-aws-profile-name"

```

Edit `backend.tf` with your remote state S3 bucket:

### 4. Initialize Terraform

```hcl

terraform {```bash

  backend "s3" {terraform init

    bucket = "your-terraform-state-bucket"```

    key    = "s3_static_web/terraform.tfstate"

    region = "us-east-1"### 5. Review the Plan

  }

}```bash

```terraform plan

```

> **Note**: No AWS profile needed - authentication uses environment variables automatically.

### 6. Deploy the Infrastructure

### 3. Configure Variables (Optional)

```bash

Customize your deployment by copying and editing the sample file:terraform apply

```

```bash

cp terraform.tfvars.sample terraform.tfvarsType `yes` when prompted to confirm the deployment.

```

## 📁 Project Structure

Available variables:

- `aws_region` - AWS region (default: `us-east-1`)```

- `bucket_prefix` - S3 bucket name prefix (default: `my-static-website-`).

- `bucket_region` - S3 bucket region (default: `us-east-1`)├── backend.tf                    # Remote state backend configuration

- `aws_s3_bucket_versioning` - Enable versioning (default: `Enabled`)├── cloudfront.tf                 # CloudFront CDN distribution

- `tags` - Resource tags (default: Dev environment)├── providers.tf                  # AWS provider configuration

├── s3.tf                         # S3 bucket and website configuration

### 4. Initialize Terraform├── variable.tf                   # Variable definitions

├── terraform.tfvars.sample       # Sample variables file

```bash├── terraform.tfvars              # Your local configuration (gitignored)

terraform init└── www/                          # Website content directory

```    ├── index.html                # Homepage

    ├── error.html                # Error page

### 5. Review the Plan    ├── style.css                 # Stylesheets

    └── script.js                 # JavaScript files

```bash```

terraform plan

```## 🔧 Configuration Variables



### 6. Deploy the Infrastructure### Required Variables



```bash| Variable | Description |

terraform apply|----------|-------------|

```| `aws_profile` | AWS CLI profile name for authentication |



Type `yes` when prompted to confirm the deployment.### Optional Variables



## 📁 Project Structure| Variable | Default | Description |

|----------|---------|-------------|

```| `aws_region` | `us-east-1` | AWS region for resource deployment |

.| `bucket_prefix` | `my-static-website-` | Prefix for the S3 bucket name |

├── .github/workflows/| `bucket_region` | `us-east-1` | Region for the website S3 bucket |

│   └── terraform.yml             # GitHub Actions CI/CD pipeline| `aws_s3_bucket_versioning` | `Enabled` | Enable/disable S3 versioning |

├── backend.tf                    # Remote state backend configuration| `tags` | See below | Resource tags |

├── cloudfront.tf                 # CloudFront CDN distribution

├── providers.tf                  # AWS provider configurationDefault tags:

├── s3.tf                         # S3 bucket and website configuration```hcl

├── variable.tf                   # Variable definitionstags = {

├── terraform.tfvars.sample       # Sample variables file  Environment = "Dev"

├── terraform.tfvars              # Your local configuration (gitignored)  Project     = "S3StaticWebsite"

└── www/                          # Website content directory}

    ├── index.html                # Homepage```

    ├── error.html                # Error page

    ├── style.css                 # Stylesheets## 📤 Outputs

    └── script.js                 # JavaScript files

```After deployment, Terraform outputs:



## 🔧 Configuration Variables- **website_endpoint**: Direct S3 website endpoint URL

- **cdn_domain_name**: CloudFront distribution domain name (recommended)

### Optional Variables

Access your website at: `https://<cdn_domain_name>`

| Variable | Default | Description |

|----------|---------|-------------|## 🌐 Adding/Updating Website Content

| `aws_region` | `us-east-1` | AWS region for resource deployment |

| `bucket_prefix` | `my-static-website-` | Prefix for the S3 bucket name |1. Place your static files in the `www/` directory

| `bucket_region` | `us-east-1` | Region for the website S3 bucket |2. Run `terraform apply` to sync changes to S3

| `aws_s3_bucket_versioning` | `Enabled` | Enable/disable S3 versioning |

| `tags` | `{Environment="Dev", Project="S3StaticWebsite"}` | Resource tags |Supported file types are automatically detected:

- HTML, CSS, JavaScript

## 📤 Outputs- Images (PNG, JPG, GIF)



After deployment, Terraform outputs:## 🔒 Security Features



- **website_endpoint**: Direct S3 website endpoint URL- S3 bucket public access configured for website hosting

- **cdn_domain_name**: CloudFront distribution domain name (recommended)- Bucket policy allows public read access to objects

- CloudFront uses HTTPS for secure content delivery

Access your website at: `https://<cdn_domain_name>`- State file stored securely in S3 remote backend

- Sensitive configuration (`terraform.tfvars`) is gitignored

## 🌐 Adding/Updating Website Content

## 🗑️ Cleanup

1. Place your static files in the `www/` directory

2. Run `terraform apply` to sync changes to S3To destroy all resources:

3. Or push to `main` branch to trigger automatic deployment via GitHub Actions

```bash

Supported file types are automatically detected:terraform destroy

- HTML, CSS, JavaScript```

- Images (PNG, JPG, GIF)

Type `yes` when prompted to confirm resource deletion.

## 🔄 CI/CD Pipeline

## 📝 Notes

The project includes a GitHub Actions workflow that automatically:

- The S3 bucket name is automatically generated using the `bucket_prefix` variable

1. **On Pull Request**:- CloudFront distribution deployment may take 15-20 minutes

   - Runs `terraform fmt -check` to validate formatting- Website files are automatically uploaded from the `www/` directory

   - Runs `terraform validate` to check configuration- Content-Type headers are automatically set based on file extensions

   - Runs `terraform plan` to preview changes- Before using this project, update `backend.tf` with your own S3 bucket and AWS profile

- The backend configuration is committed to the repository for consistency

2. **On Push to Main**:

   - Performs all PR checks## 🤝 Contributing

   - Automatically applies changes with `terraform apply -auto-approve`

   - Deploys infrastructure updates1. Fork the repository

2. Create a feature branch

### Workflow Features3. Commit your changes

- ✅ Automated formatting checks4. Push to the branch

- ✅ Configuration validation5. Open a Pull Request

- ✅ Plan preview for PRs

- ✅ Automatic deployment on merge## 📄 License

- ✅ Uses AWS credentials from GitHub Secrets

See [LICENSE](LICENSE) file for details.

## 🔒 Security Features

## ⚠️ Important Reminders

- ✅ AWS credentials stored as environment variables (never hardcoded)

- ✅ Terraform state stored securely in S3 remote backend- **Update `backend.tf`** with your own S3 bucket for remote state before running `terraform init`

- ✅ S3 bucket configured for public website hosting- Never commit `terraform.tfvars` with sensitive credentials (it is gitignored)

- ✅ CloudFront provides HTTPS for secure content delivery- Ensure your AWS credentials have sufficient permissions

- ✅ Sensitive files (`terraform.tfvars`) gitignored- CloudFront distributions incur charges even when idle

- ✅ GitHub Secrets protect AWS credentials in CI/CD- Review AWS pricing before deployment



## 🗑️ Cleanup## 🆘 Troubleshooting



To destroy all resources:### Issue: Terraform init fails with backend errors

**Solution**: 

```bash- Verify the S3 bucket specified in `backend.tf` exists and is accessible

terraform destroy- Ensure your AWS profile has permissions to access the S3 bucket

```- Check that the profile name in `backend.tf` matches your AWS CLI configuration



Type `yes` when prompted to confirm resource deletion.### Issue: Access denied errors

**Solution**: Check your AWS profile permissions and ensure the IAM user has required policies for S3, CloudFront, and IAM operations.

## 📝 Important Notes

### Issue: CloudFront not serving content

- ✅ **Same authentication method** for local and CI/CD (environment variables)**Solution**: Wait 15-20 minutes for distribution deployment to complete. Check CloudFront console for status.

- ✅ S3 bucket name is automatically generated using the `bucket_prefix` variable

- ⏱️ CloudFront distribution deployment may take 15-20 minutes## 📚 Additional Resources

- 📁 Website files are automatically uploaded from the `www/` directory

- 🏷️ Content-Type headers are automatically set based on file extensions- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

- 🔧 Update `backend.tf` with your own S3 bucket for remote state- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)

- 💰 CloudFront distributions incur charges even when idle - review AWS pricing- [CloudFront Documentation](https://docs.aws.amazon.com/cloudfront/)


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
- Never commit `terraform.tfvars` or AWS credentials to version control
- Ensure your AWS credentials have sufficient permissions:
  - S3: CreateBucket, PutObject, PutBucketPolicy, etc.
  - CloudFront: CreateDistribution, etc.
  - IAM: Permissions to create and manage resources
- Review AWS pricing before deployment

## 🆘 Troubleshooting

### Issue: Terraform init fails with credential errors
**Solution**: 
- Verify environment variables are set: `echo $AWS_ACCESS_KEY_ID`
- For bash: ensure variables are exported in `~/.bashrc` and reloaded
- For GitHub Actions: verify secrets are set in repository settings

### Issue: Backend S3 bucket not found
**Solution**: 
- Verify the S3 bucket specified in `backend.tf` exists
- Ensure your AWS credentials have access to the bucket
- Check the bucket is in the correct region

### Issue: Access denied errors
**Solution**: 
- Check IAM permissions for your AWS credentials
- Ensure the user has policies for S3, CloudFront, and IAM operations
- Verify the credentials are correctly set in environment variables

### Issue: CloudFront not serving content
**Solution**: 
- Wait 15-20 minutes for distribution deployment to complete
- Check CloudFront console for deployment status
- Verify S3 bucket website configuration is correct

### Issue: GitHub Actions workflow fails
**Solution**: 
- Verify `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set in GitHub Secrets
- Check workflow logs for specific error messages
- Ensure the backend S3 bucket is accessible from GitHub Actions

## 📚 Additional Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [CloudFront Documentation](https://docs.aws.amazon.com/cloudfront/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Terraform Backend Configuration](https://developer.hashicorp.com/terraform/language/backend/s3)

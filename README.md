# S3 Static Website with CloudFront CDN# S3 Static Website with CloudFront CDN# S3 Static Website with CloudFront CDN



This Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery. The project uses AWS environment variables for authentication, making it work seamlessly in both local development and CI/CD environments.



## 🏗️ ArchitectureThis Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery. The project uses AWS environment variables for authentication, making it work seamlessly in both local development and CI/CD environments.This Terraform project provisions a fully functional static website hosted on AWS S3 with CloudFront CDN distribution for enhanced performance and global content delivery.



The infrastructure includes:

- **S3 Bucket**: Hosts static website files with public read access

- **CloudFront Distribution**: CDN for faster global content delivery## 🏗️ Architecture## 🏗️ Architecture

- **Remote State Backend**: S3 backend for remote state storage

- **Versioning**: S3 bucket versioning enabled by default

- **CI/CD Pipeline**: GitHub Actions workflow for automated deployments

The infrastructure includes:The infrastructure includes:

## 📋 Prerequisites

- **S3 Bucket**: Hosts static website files with public read access- **S3 Bucket**: Hosts static website files with public read access

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)

- AWS Account with appropriate permissions- **CloudFront Distribution**: CDN for faster global content delivery- **CloudFront Distribution**: CDN for faster global content delivery

- AWS credentials configured as environment variables

- An existing S3 bucket for Terraform remote state storage- **Remote State Backend**: S3 backend for remote state storage- **Remote State Backend**: S3 backend for remote state storage



## 🔑 AWS Credentials Setup- **Versioning**: S3 bucket versioning enabled by default- **Versioning**: S3 bucket versioning enabled by default



This project uses **AWS environment variables** for authentication, working identically in both local and CI/CD environments.- **CI/CD Pipeline**: GitHub Actions workflow for automated deployments



### Local Development## 📋 Prerequisites



Add these to your `~/.bashrc` or `~/.bash_profile`:## 📋 Prerequisites



```bash- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)

export AWS_ACCESS_KEY_ID="your-access-key-id"

export AWS_SECRET_ACCESS_KEY="your-secret-access-key"- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)- AWS Account with appropriate permissions

export AWS_DEFAULT_REGION="us-east-1"

```- AWS Account with appropriate permissions- AWS CLI configured with credentials



Reload your shell:- AWS credentials configured as environment variables- An existing S3 bucket for Terraform remote state storage

```bash

source ~/.bashrc- An existing S3 bucket for Terraform remote state storage

```

## 🚀 Quick Start

Verify credentials are set:

```bash## 🔑 AWS Credentials Setup

echo $AWS_ACCESS_KEY_ID

aws sts get-caller-identity### 1. Clone the Repository

```

This project uses **AWS environment variables** for authentication. This approach works identically in both local development and GitHub Actions CI/CD.

### GitHub Actions (CI/CD)

```bash

1. Go to your repository: **Settings** → **Secrets and variables** → **Actions**

2. Add repository secrets:### Local Developmentgit clone https://github.com/Ishihab/s3_static_web.git

   - `AWS_ACCESS_KEY_ID`: Your AWS access key

   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret keycd s3_static_website



The workflow file (`.github/workflows/terraform.yml`) automatically uses these secrets.Add these to your `~/.bashrc` or `~/.bash_profile`:```



## 🚀 Quick Start



### 1. Clone the Repository```bash### 2. Configure Backend



```bashexport AWS_ACCESS_KEY_ID="your-access-key-id"

git clone https://github.com/Ishihab/s3_static_web.git

cd s3_static_webexport AWS_SECRET_ACCESS_KEY="your-secret-access-key"Edit `backend.tf` with your remote state configuration:

```

export AWS_DEFAULT_REGION="us-east-1"

### 2. Configure Backend

``````hcl

Edit `backend.tf` with your remote state S3 bucket:

terraform {

```hcl

terraform {Reload your shell:  backend "s3" {

  backend "s3" {

    bucket = "your-terraform-state-bucket"```bash    bucket = "your-terraform-state-bucket"

    key    = "s3_static_web/terraform.tfstate"

    region = "us-east-1"source ~/.bashrc    key    = "s3_static_web/terraform.tfstate"

  }

}```    region = "us-east-1"

```

    profile = "your-aws-profile"

> **Note**: Authentication uses environment variables automatically - no profile needed.

### GitHub Actions (CI/CD)    use_lockfile = true

### 3. Configure Variables (Optional)

  }

Customize your deployment:

1. Go to your repository: **Settings** → **Secrets and variables** → **Actions**}

```bash

cp terraform.tfvars.sample terraform.tfvars2. Add repository secrets:```

```

   - `AWS_ACCESS_KEY_ID`: Your AWS access key

Edit `terraform.tfvars` to customize:

- `aws_region` - AWS region (default: `us-east-1`)   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key> **Note**: Update the `bucket`, `region`, and `profile` values to match your AWS environment.

- `bucket_prefix` - S3 bucket name prefix (default: `my-static-website-`)

- `bucket_region` - S3 bucket region (default: `us-east-1`)

- `aws_s3_bucket_versioning` - Enable versioning (default: `Enabled`)

- `tags` - Resource tagsThe workflow file (`.github/workflows/terraform.yml`) automatically uses these secrets.### 3. Configure Variables



### 4. Initialize Terraform



```bash## 🚀 Quick StartCopy the sample tfvars file and update with your values:

terraform init

```



### 5. Review the Plan### 1. Clone the Repository```bash



```bashcp terraform.tfvars.sample terraform.tfvars

terraform plan

``````bash```



### 6. Deploy the Infrastructuregit clone https://github.com/Ishihab/s3_static_web.git



```bashcd s3_static_webEdit `terraform.tfvars` with your AWS profile:

terraform apply

``````



Type `yes` when prompted to confirm the deployment.```hcl



## 📁 Project Structure### 2. Configure Backendaws_profile = "your-aws-profile-name"



``````

.

├── .github/workflows/Edit `backend.tf` with your remote state S3 bucket:

│   └── terraform.yml             # GitHub Actions CI/CD pipeline

├── backend.tf                    # Remote state backend configuration### 4. Initialize Terraform

├── cloudfront.tf                 # CloudFront CDN distribution

├── providers.tf                  # AWS provider configuration```hcl

├── s3.tf                         # S3 bucket and website configuration

├── variable.tf                   # Variable definitionsterraform {```bash

├── terraform.tfvars.sample       # Sample variables file

├── terraform.tfvars              # Your local configuration (gitignored)  backend "s3" {terraform init

└── www/                          # Website content directory

    ├── index.html                # Homepage    bucket = "your-terraform-state-bucket"```

    ├── error.html                # Error page

    ├── style.css                 # Stylesheets    key    = "s3_static_web/terraform.tfstate"

    └── script.js                 # JavaScript files

```    region = "us-east-1"### 5. Review the Plan



## 🔧 Configuration Variables  }



### Optional Variables}```bash



| Variable | Default | Description |```terraform plan

|----------|---------|-------------|

| `aws_region` | `us-east-1` | AWS region for resource deployment |```

| `bucket_prefix` | `my-static-website-` | Prefix for the S3 bucket name |

| `bucket_region` | `us-east-1` | Region for the website S3 bucket |> **Note**: No AWS profile needed - authentication uses environment variables automatically.

| `aws_s3_bucket_versioning` | `Enabled` | Enable/disable S3 versioning |

| `tags` | `{Environment="Dev", Project="S3StaticWebsite"}` | Resource tags |### 6. Deploy the Infrastructure



## 📤 Outputs### 3. Configure Variables (Optional)



After deployment, Terraform outputs:```bash



- **website_endpoint**: Direct S3 website endpoint URLCustomize your deployment by copying and editing the sample file:terraform apply

- **cdn_domain_name**: CloudFront distribution domain name (recommended)

```

Access your website at: `https://<cdn_domain_name>`

```bash

## 🌐 Adding/Updating Website Content

cp terraform.tfvars.sample terraform.tfvarsType `yes` when prompted to confirm the deployment.

1. Place your static files in the `www/` directory

2. Run `terraform apply` to sync changes to S3```

3. Or push to `main` branch to trigger automatic deployment via GitHub Actions

## 📁 Project Structure

Supported file types are automatically detected:

- HTML, CSS, JavaScriptAvailable variables:

- Images (PNG, JPG, GIF)

- `aws_region` - AWS region (default: `us-east-1`)```

## 🔄 CI/CD Pipeline

- `bucket_prefix` - S3 bucket name prefix (default: `my-static-website-`).

The project includes a GitHub Actions workflow that automatically:

- `bucket_region` - S3 bucket region (default: `us-east-1`)├── backend.tf                    # Remote state backend configuration

### On Pull Request:

- Runs `terraform fmt -check` to validate formatting- `aws_s3_bucket_versioning` - Enable versioning (default: `Enabled`)├── cloudfront.tf                 # CloudFront CDN distribution

- Runs `terraform validate` to check configuration

- Runs `terraform plan` to preview changes- `tags` - Resource tags (default: Dev environment)├── providers.tf                  # AWS provider configuration



### On Push to Main:├── s3.tf                         # S3 bucket and website configuration

- Performs all PR checks

- Automatically applies changes with `terraform apply -auto-approve`### 4. Initialize Terraform├── variable.tf                   # Variable definitions

- Deploys infrastructure updates

├── terraform.tfvars.sample       # Sample variables file

### Workflow Features:

- ✅ Automated formatting checks```bash├── terraform.tfvars              # Your local configuration (gitignored)

- ✅ Configuration validation

- ✅ Plan preview for PRsterraform init└── www/                          # Website content directory

- ✅ Automatic deployment on merge

- ✅ Uses AWS credentials from GitHub Secrets```    ├── index.html                # Homepage



## 🔒 Security Features    ├── error.html                # Error page



- ✅ AWS credentials stored as environment variables (never hardcoded)### 5. Review the Plan    ├── style.css                 # Stylesheets

- ✅ Terraform state stored securely in S3 remote backend

- ✅ S3 bucket configured for public website hosting    └── script.js                 # JavaScript files

- ✅ CloudFront provides HTTPS for secure content delivery

- ✅ Sensitive files (`terraform.tfvars`) gitignored```bash```

- ✅ GitHub Secrets protect AWS credentials in CI/CD

terraform plan

## 🗑️ Cleanup

```## 🔧 Configuration Variables

To destroy all resources:



```bash

terraform destroy### 6. Deploy the Infrastructure### Required Variables

```



Type `yes` when prompted to confirm resource deletion.

```bash| Variable | Description |

## 📝 Important Notes

terraform apply|----------|-------------|

- ✅ **Same authentication method** for local and CI/CD (environment variables)

- ✅ S3 bucket name is automatically generated using the `bucket_prefix` variable```| `aws_profile` | AWS CLI profile name for authentication |

- ⏱️ CloudFront distribution deployment may take 15-20 minutes

- 📁 Website files are automatically uploaded from the `www/` directory

- 🏷️ Content-Type headers are automatically set based on file extensions

- 🔧 Update `backend.tf` with your own S3 bucket for remote stateType `yes` when prompted to confirm the deployment.### Optional Variables

- 💰 CloudFront distributions incur charges even when idle - review AWS pricing



## 🤝 Contributing

## 📁 Project Structure| Variable | Default | Description |

1. Fork the repository

2. Create a feature branch|----------|---------|-------------|

3. Commit your changes

4. Push to the branch```| `aws_region` | `us-east-1` | AWS region for resource deployment |

5. Open a Pull Request

.| `bucket_prefix` | `my-static-website-` | Prefix for the S3 bucket name |

## 📄 License

├── .github/workflows/| `bucket_region` | `us-east-1` | Region for the website S3 bucket |

See [LICENSE](LICENSE) file for details.

│   └── terraform.yml             # GitHub Actions CI/CD pipeline| `aws_s3_bucket_versioning` | `Enabled` | Enable/disable S3 versioning |

## ⚠️ Important Reminders

├── backend.tf                    # Remote state backend configuration| `tags` | See below | Resource tags |

- **Update `backend.tf`** with your own S3 bucket for remote state before running `terraform init`

- Never commit `terraform.tfvars` or AWS credentials to version control├── cloudfront.tf                 # CloudFront CDN distribution

- Ensure your AWS credentials have sufficient permissions:

  - S3: CreateBucket, PutObject, PutBucketPolicy, etc.├── providers.tf                  # AWS provider configurationDefault tags:

  - CloudFront: CreateDistribution, etc.

  - IAM: Permissions to create and manage resources├── s3.tf                         # S3 bucket and website configuration```hcl

- Review AWS pricing before deployment

├── variable.tf                   # Variable definitionstags = {

## 🆘 Troubleshooting

├── terraform.tfvars.sample       # Sample variables file  Environment = "Dev"

### Issue: Terraform init fails with credential errors

**Solution**: ├── terraform.tfvars              # Your local configuration (gitignored)  Project     = "S3StaticWebsite"

- Verify environment variables are set: `echo $AWS_ACCESS_KEY_ID`

- For bash: ensure variables are exported in `~/.bashrc` and reloaded with `source ~/.bashrc`└── www/                          # Website content directory}

- For GitHub Actions: verify secrets are set in repository settings

    ├── index.html                # Homepage```

### Issue: Backend S3 bucket not found

**Solution**:     ├── error.html                # Error page

- Verify the S3 bucket specified in `backend.tf` exists

- Ensure your AWS credentials have access to the bucket    ├── style.css                 # Stylesheets## 📤 Outputs

- Check the bucket is in the correct region

    └── script.js                 # JavaScript files

### Issue: Access denied errors

**Solution**: ```After deployment, Terraform outputs:

- Check IAM permissions for your AWS credentials

- Ensure the user has policies for S3, CloudFront, and IAM operations

- Verify the credentials are correctly set in environment variables

## 🔧 Configuration Variables- **website_endpoint**: Direct S3 website endpoint URL

### Issue: CloudFront not serving content

**Solution**: - **cdn_domain_name**: CloudFront distribution domain name (recommended)

- Wait 15-20 minutes for distribution deployment to complete

- Check CloudFront console for deployment status### Optional Variables

- Verify S3 bucket website configuration is correct

Access your website at: `https://<cdn_domain_name>`

### Issue: GitHub Actions workflow fails

**Solution**: | Variable | Default | Description |

- Verify `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set in GitHub Secrets

- Check workflow logs for specific error messages|----------|---------|-------------|## 🌐 Adding/Updating Website Content

- Ensure the backend S3 bucket is accessible from GitHub Actions

| `aws_region` | `us-east-1` | AWS region for resource deployment |

### Issue: Terraform formatting check fails

**Solution**:| `bucket_prefix` | `my-static-website-` | Prefix for the S3 bucket name |1. Place your static files in the `www/` directory

- Run `terraform fmt` locally to fix formatting

- Commit and push the formatted files| `bucket_region` | `us-east-1` | Region for the website S3 bucket |2. Run `terraform apply` to sync changes to S3

- The CI/CD pipeline will pass on the next run

| `aws_s3_bucket_versioning` | `Enabled` | Enable/disable S3 versioning |

## 📚 Additional Resources

| `tags` | `{Environment="Dev", Project="S3StaticWebsite"}` | Resource tags |Supported file types are automatically detected:

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)- HTML, CSS, JavaScript

- [CloudFront Documentation](https://docs.aws.amazon.com/cloudfront/)

- [GitHub Actions Documentation](https://docs.github.com/en/actions)## 📤 Outputs- Images (PNG, JPG, GIF)

- [Terraform Backend Configuration](https://developer.hashicorp.com/terraform/language/backend/s3)



## 🎯 AWS Services Used

After deployment, Terraform outputs:## 🔒 Security Features

This project demonstrates hands-on experience with the following AWS services:



### Amazon S3

- Static website hosting configuration- **website_endpoint**: Direct S3 website endpoint URL- S3 bucket public access configured for website hosting

- Bucket policies for public access

- Versioning and lifecycle management- **cdn_domain_name**: CloudFront distribution domain name (recommended)- Bucket policy allows public read access to objects

- Object storage and management

- CloudFront uses HTTPS for secure content delivery

### Amazon CloudFront

- CDN distribution setupAccess your website at: `https://<cdn_domain_name>`- State file stored securely in S3 remote backend

- Origin configuration with S3

- Cache behavior configuration- Sensitive configuration (`terraform.tfvars`) is gitignored

- HTTPS/SSL support

## 🌐 Adding/Updating Website Content

### AWS IAM

- Credential management## 🗑️ Cleanup

- Permission policies

- Secure authentication practices1. Place your static files in the `www/` directory


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

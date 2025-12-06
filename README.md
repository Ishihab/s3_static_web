# S3 Static Website with CloudFront

This project contains Terraform code to deploy a static website on AWS S3, served through a CloudFront distribution.

## Features

-   **S3 Bucket:** An S3 bucket is created to store the static website files (`index.html`, `error.html`, CSS, and JavaScript).
-   **Public Access:** The S3 bucket is configured for public read access.
-   **Website Hosting:** S3 static website hosting is enabled.
-   **CloudFront Distribution:** A CloudFront distribution is set up to serve the website content with low latency and high transfer speeds.
-   **Versioning:** S3 bucket versioning is enabled to keep a history of your objects.

## Prerequisites

Before you begin, ensure you have the following installed:

-   [Terraform](https://www.terraform.io/downloads.html) (v1.0 or later)
-   [AWS CLI](https://aws.amazon.com/cli/) configured with your AWS credentials.

## Configuration

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Ishihab/s3_static_web.git
    cd s3_static_web
    ```

2.  **Configure variables:**
    Create a `terraform.tfvars` file by copying the sample file:
    ```bash
    cp terraform.tfvars.sample terraform.tfvars
    ```
    Modify `terraform.tfvars` to set your desired values. The following variables are available:

    | Variable                   | Description                                      | Default                |
    | -------------------------- | ------------------------------------------------ | ---------------------- |
    | `aws_region`               | The AWS region to deploy resources in.           | `us-east-1`            |
    | `aws_s3_bucket_versioning` | Enable versioning for the S3 bucket.             | `Enabled`              |
    | `tags`                     | A map of tags to assign to the resources.        | `{ Environment = "Dev", Project = "S3StaticWebsite" }` |
    | `bucket_prefix`            | Prefix for the S3 bucket name.                   | `my-static-website-`   |
    | `bucket_region`            | The AWS region where the S3 bucket will be created.| `us-east-1`            |


## Deployment

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

2.  **Plan the deployment:**
    ```bash
    terraform plan
    ```

3.  **Apply the configuration:**
    ```bash
    terraform apply
    ```
    Enter `yes` when prompted to confirm the deployment.

## Outputs

After a successful deployment, Terraform will output the following:

-   `website_endpoint`: The endpoint URL of the S3 static website.
-   `cdn_domain_name`: The domain name of the CloudFront distribution. You should use this URL to access your website.

## Cleanup

To destroy all the resources created by this project, run:

```bash
terraform destroy
```
Enter `yes` when prompted to confirm the destruction of resources.

## Project Structure

-   `main.tf`: Defines the main Terraform resources.
-   `providers.tf`: Configures the AWS provider.
-   `s3.tf`: Contains all S3-related resources.
-   `cloudfront.tf`: Contains the CloudFront distribution resource.
-   `variable.tf`: Declares the input variables for the project.
-   `terraform.tfvars.sample`: A sample file for your variables.
-   `www/`: A directory containing the sample static website files.

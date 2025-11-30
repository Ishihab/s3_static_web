resource "aws_s3_bucket" "static_website_bucket" {
    bucket_prefix = "my-static-website-"
    tags = {
      Name        = "My Static Website Bucket"
      Environment = "Dev"
    } 
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.static_website_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
    bucket = aws_s3_bucket.static_website_bucket.id

    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "error.html"
    }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.static_website_bucket.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.static_website_bucket.id

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Sid       = "PublicReadGetObject"
          Effect    = "Allow"
          Principal = "*"
          Action    = "s3:GetObject"
          Resource  = "${aws_s3_bucket.static_website_bucket.arn}/*"
        }
      ]
    })
}

resource "aws_s3_object" "website_files" {
    for_each = fileset("${path.module}/www", "**")

    bucket = aws_s3_bucket.static_website_bucket.id
    key    = each.value
    source = "${path.module}/www/${each.value}"
    etag   = filemd5("${path.module}/www/${each.value}")
    content_type = lookup({
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
      png  = "image/png"
      jpg  = "image/jpeg"
      gif  = "image/gif"
    }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
  
}

output "website_endpoint" {
    description = "The endpoint URL of the S3 static website"
    value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}


resource "aws_s3_bucket" "static_website_bucket" {
  bucket_prefix = var.bucket_prefix
  region        = var.bucket_region
  tags          = var.tags
}


resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.static_website_bucket.id
  versioning_configuration {
    status = var.aws_s3_bucket_versioning
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

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket     = aws_s3_bucket.static_website_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "${aws_cloudfront_distribution.cdn_distribution.arn}"
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


resource "aws_cloudfront_distribution" "cdn_distribution" {
    origin {
      domain_name = aws_s3_bucket_website_configuration.website_config.website_endpoint
      origin_id   = "S3-${aws_s3_bucket.static_website_bucket.id}"

      custom_origin_config {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    }

    enabled             = true
    is_ipv6_enabled     = true
    comment             = "CDN for S3 Static Website"
    default_root_object = "index.html"

    default_cache_behavior {
      allowed_methods  = ["GET", "HEAD"]
      cached_methods   = ["GET", "HEAD"]
      target_origin_id = "S3-${aws_s3_bucket.static_website_bucket.id}"

      forwarded_values {
        query_string = false

        cookies {
          forward = "none"
        }
      }

      viewer_protocol_policy = "allow-all"
      min_ttl                = 0
      default_ttl            = 3600
      max_ttl                = 86400
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      cloudfront_default_certificate = true
    }

    tags = var.tags
  
}

output "cdn_domain_name" {
    description = "The domain name of the CloudFront distribution"
    value       = aws_cloudfront_distribution.cdn_distribution.domain_name
  
}
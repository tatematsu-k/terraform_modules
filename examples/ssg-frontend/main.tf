terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

# ACM証明書の作成（例として）
resource "aws_acm_certificate" "frontend" {
  domain_name       = "example.com"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "example.com"
  }
}

module "ssg_frontend" {
  source = "../../modules/ssg-frontend"

  bucket_name         = "my-ssg-frontend-example"
  domain_names        = ["example.com"]
  acm_certificate_arn = aws_acm_certificate.frontend.arn
  price_class         = "PriceClass_100"

  # ライフサイクルルールの設定（オプション）
  enable_lifecycle_rule = true
  lifecycle_rule = {
    noncurrent_version_expiration_days          = 30
    noncurrent_version_transition_days          = 7
    noncurrent_version_transition_storage_class = "STANDARD_IA"
  }

  tags = {
    Environment = "example"
    Project     = "ssg-frontend"
  }
}
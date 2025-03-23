output "s3_bucket_name" {
  description = "作成されたS3バケットの名前"
  value       = aws_s3_bucket.frontend.id
}

output "s3_bucket_arn" {
  description = "作成されたS3バケットのARN"
  value       = aws_s3_bucket.frontend.arn
}

output "cloudfront_distribution_id" {
  description = "作成されたCloudFrontディストリビューションのID"
  value       = aws_cloudfront_distribution.frontend.id
}

output "cloudfront_distribution_domain_name" {
  description = "作成されたCloudFrontディストリビューションのドメイン名"
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "cloudfront_distribution_arn" {
  description = "作成されたCloudFrontディストリビューションのARN"
  value       = aws_cloudfront_distribution.frontend.arn
}
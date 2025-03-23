# SPA Frontend Module

このモジュールは、SPA（Single Page Application）でビルドしたフロントエンドアプリケーションをAWS S3 + CloudFrontで配信するためのTerraformモジュールです。

## 機能

- S3バケットの作成と設定
- CloudFrontディストリビューションの作成と設定
- Origin Access Control (OAC)の設定
- カスタムドメインのサポート
- WAFの統合オプション
- SPA用の特別な設定（すべてのリクエストをindex.htmlにリダイレクト）

## 使用方法

```hcl
module "spa_frontend" {
  source = "github.com/your-org/terraform_modules/modules/spa-frontend"

  bucket_name         = "my-spa-frontend"
  domain_names       = ["example.com"]
  acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxx"
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## 要件

- Terraform >= 1.0.0
- AWS Provider >= 4.0.0
- AWS CLIが設定されていること

## 入力変数

| 名前 | 説明 | 型 | デフォルト値 | 必須 |
|------|------|------|--------------|------|
| bucket_name | S3バケットの名前 | string | - | yes |
| domain_names | CloudFrontのカスタムドメイン名のリスト | list(string) | [] | no |
| acm_certificate_arn | ACM証明書のARN | string | - | yes |
| price_class | CloudFrontの価格クラス | string | "PriceClass_100" | no |
| web_acl_id | WAFのWeb ACL ID | string | null | no |
| tags | リソースに付与するタグ | map(string) | {} | no |

## 出力

| 名前 | 説明 |
|------|------|
| s3_bucket_name | 作成されたS3バケットの名前 |
| s3_bucket_arn | 作成されたS3バケットのARN |
| cloudfront_distribution_id | 作成されたCloudFrontディストリビューションのID |
| cloudfront_distribution_domain_name | 作成されたCloudFrontディストリビューションのドメイン名 |
| cloudfront_distribution_arn | 作成されたCloudFrontディストリビューションのARN |
# Terraform Modules for Frontend Deployment

このリポジトリには、フロントエンドアプリケーションをAWS S3 + CloudFrontで配信するためのTerraformモジュールが含まれています。

## 利用可能なモジュール

### SSG Frontend Module
SSG（Static Site Generator）でビルドしたフロントエンドアプリケーションをAWS S3 + CloudFrontで配信するためのモジュール。

### SPA Frontend Module
SPA（Single Page Application）でビルドしたフロントエンドアプリケーションをAWS S3 + CloudFrontで配信するためのモジュール。

## 使用方法

各モジュールの使用方法については、各モジュールのディレクトリ内のREADMEを参照してください。

## 前提条件

- Terraform >= 1.0.0
- AWS Provider >= 4.0.0
- AWS CLIが設定されていること

## ライセンス

MIT
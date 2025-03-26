variable "bucket_name" {
  description = "S3バケットの名前"
  type        = string
}

variable "domain_names" {
  description = "CloudFrontのカスタムドメイン名のリスト"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ACM証明書のARN"
  type        = string
  default     = null
}

variable "price_class" {
  description = "CloudFrontの価格クラス"
  type        = string
  default     = "PriceClass_100"
}

variable "web_acl_id" {
  description = "WAFのWeb ACL ID"
  type        = string
  default     = null
}

variable "tags" {
  description = "リソースに付与するタグ"
  type        = map(string)
  default     = {}
}

variable "enable_lifecycle_rule" {
  description = "ライフサイクルルールを有効化するかどうか"
  type        = bool
  default     = false
}

variable "lifecycle_rule" {
  description = "ライフサイクルルールの設定"
  type = object({
    noncurrent_version_expiration_days          = optional(number, 30)
    noncurrent_version_transition_days          = optional(number, 7)
    noncurrent_version_transition_storage_class = optional(string, "STANDARD_IA")
  })
  default = null
}

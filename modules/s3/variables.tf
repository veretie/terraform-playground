variable "name_prefix" {
  description = "Prefix used for generated bucket names."
  type        = string
}

variable "bucket_key" {
  description = "Logical bucket key appended to the bucket name."
  type        = string
}

variable "bucket_name" {
  description = "Optional explicit bucket name. Defaults to name_prefix-bucket_key."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Whether Terraform can destroy the bucket when it contains objects."
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Whether S3 bucket versioning is enabled."
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm."
  type        = string
  default     = "AES256"
}

variable "bucket_key_enabled" {
  description = "Whether S3 bucket keys are enabled for KMS encryption."
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Whether all public access should be blocked."
  type        = bool
  default     = true
}

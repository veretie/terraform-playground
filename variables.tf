variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Short project name used in resource names."
  type        = string
}

variable "environment" {
  description = "Deployment environment name, such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags applied to all supported AWS resources."
  type        = map(string)
  default     = {}
}

variable "s3_buckets" {
  description = "S3 bucket definitions keyed by logical name."
  type = map(object({
    bucket_name         = optional(string, null)
    force_destroy       = optional(bool, false)
    versioning_enabled  = optional(bool, true)
    sse_algorithm       = optional(string, "AES256")
    bucket_key_enabled  = optional(bool, false)
    block_public_access = optional(bool, true)
  }))
  default = {}
}

variable "sqs_queues" {
  description = "SQS queue definitions keyed by logical name."
  type = map(object({
    fifo_queue                  = optional(bool, false)
    content_based_deduplication = optional(bool, false)
    visibility_timeout_seconds  = optional(number, 30)
    message_retention_seconds   = optional(number, 345600)
    delay_seconds               = optional(number, 0)
    max_message_size            = optional(number, 262144)
    receive_wait_time_seconds   = optional(number, 0)
    kms_master_key_id           = optional(string, null)
    create_dlq                  = optional(bool, true)
    max_receive_count           = optional(number, 5)
  }))
  default = {}
}

variable "ses_identities" {
  description = "SES domain identities keyed by logical name."
  type = map(object({
    domain       = string
    mail_from    = optional(string, null)
    dkim_enabled = optional(bool, true)
  }))
  default = {}
}

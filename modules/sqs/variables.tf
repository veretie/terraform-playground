variable "name_prefix" {
  description = "Prefix used for generated queue names."
  type        = string
}

variable "queue_key" {
  description = "Logical queue key appended to the queue name."
  type        = string
}

variable "fifo_queue" {
  description = "Whether the queue is FIFO."
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Whether content-based deduplication is enabled for FIFO queues."
  type        = bool
  default     = false
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout in seconds."
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "Message retention period in seconds."
  type        = number
  default     = 345600
}

variable "delay_seconds" {
  description = "Delivery delay in seconds."
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Maximum message size in bytes."
  type        = number
  default     = 262144
}

variable "receive_wait_time_seconds" {
  description = "Long polling wait time in seconds."
  type        = number
  default     = 0
}

variable "kms_master_key_id" {
  description = "KMS key ID or alias used for SQS server-side encryption."
  type        = string
  default     = null
}

variable "create_dlq" {
  description = "Whether to create and attach a dead-letter queue."
  type        = bool
  default     = true
}

variable "max_receive_count" {
  description = "Number of receives before a message moves to the DLQ."
  type        = number
  default     = 5
}

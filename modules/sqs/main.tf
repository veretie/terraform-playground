locals {
  base_name  = lower(replace("${var.name_prefix}-${var.queue_key}", "_", "-"))
  queue_name = var.fifo_queue ? "${local.base_name}.fifo" : local.base_name
  dlq_name   = var.fifo_queue ? "${local.base_name}-dlq.fifo" : "${local.base_name}-dlq"
}

resource "aws_sqs_queue" "dlq" {
  count = var.create_dlq ? 1 : 0

  name                        = local.dlq_name
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.fifo_queue ? var.content_based_deduplication : false
  message_retention_seconds   = var.message_retention_seconds
  kms_master_key_id           = var.kms_master_key_id
}

resource "aws_sqs_queue" "this" {
  name                        = local.queue_name
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.fifo_queue ? var.content_based_deduplication : false
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  delay_seconds               = var.delay_seconds
  max_message_size            = var.max_message_size
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  kms_master_key_id           = var.kms_master_key_id

  redrive_policy = var.create_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null
}

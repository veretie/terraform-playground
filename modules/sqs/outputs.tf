output "queue_url" {
  description = "SQS queue URL."
  value       = aws_sqs_queue.this.url
}

output "queue_arn" {
  description = "SQS queue ARN."
  value       = aws_sqs_queue.this.arn
}

output "dlq_url" {
  description = "SQS dead-letter queue URL, when enabled."
  value       = var.create_dlq ? aws_sqs_queue.dlq[0].url : null
}

output "dlq_arn" {
  description = "SQS dead-letter queue ARN, when enabled."
  value       = var.create_dlq ? aws_sqs_queue.dlq[0].arn : null
}

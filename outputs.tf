output "s3_buckets" {
  description = "Created S3 bucket names and ARNs."
  value = {
    for key, bucket in module.s3 : key => {
      name = bucket.bucket_name
      arn  = bucket.bucket_arn
    }
  }
}

output "sqs_queues" {
  description = "Created SQS queue URLs and ARNs."
  value = {
    for key, queue in module.sqs : key => {
      url     = queue.queue_url
      arn     = queue.queue_arn
      dlq_url = queue.dlq_url
      dlq_arn = queue.dlq_arn
    }
  }
}

output "ses_identities" {
  description = "SES identity verification values to publish in DNS."
  value = {
    for key, identity in module.ses : key => {
      domain                   = identity.domain
      verification_token       = identity.verification_token
      dkim_tokens              = identity.dkim_tokens
      mail_from_mx_record      = identity.mail_from_mx_record
      mail_from_txt_record     = identity.mail_from_txt_record
      mail_from_domain         = identity.mail_from_domain
    }
  }
}

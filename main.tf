module "s3" {
  source = "./modules/s3"

  for_each = var.s3_buckets

  name_prefix         = local.name_prefix
  bucket_key          = each.key
  bucket_name         = each.value.bucket_name
  force_destroy       = each.value.force_destroy
  versioning_enabled  = each.value.versioning_enabled
  sse_algorithm       = each.value.sse_algorithm
  bucket_key_enabled  = each.value.bucket_key_enabled
  block_public_access = each.value.block_public_access
}

module "sqs" {
  source = "./modules/sqs"

  for_each = var.sqs_queues

  name_prefix                 = local.name_prefix
  queue_key                   = each.key
  fifo_queue                  = each.value.fifo_queue
  content_based_deduplication = each.value.content_based_deduplication
  visibility_timeout_seconds  = each.value.visibility_timeout_seconds
  message_retention_seconds   = each.value.message_retention_seconds
  delay_seconds               = each.value.delay_seconds
  max_message_size            = each.value.max_message_size
  receive_wait_time_seconds   = each.value.receive_wait_time_seconds
  kms_master_key_id           = each.value.kms_master_key_id
  create_dlq                  = each.value.create_dlq
  max_receive_count           = each.value.max_receive_count
}

resource "aws_s3_object" "folders" {
  for_each = var.s3_folders

  bucket       = each.value.bucket
  key          = "${each.value.key}/"
  content_type = "application/x-directory"
}

module "ses" {
  source = "./modules/ses"

  for_each = var.ses_identities

  domain       = each.value.domain
  mail_from    = each.value.mail_from
  dkim_enabled = each.value.dkim_enabled
}

# Terraform Playground

Skeleton Terraform project for automating AWS SES identities, S3 buckets, and SQS queues.

## Layout

- `main.tf` wires reusable modules together.
- `variables.tf` exposes environment configuration.
- `modules/s3` creates private encrypted buckets.
- `modules/sqs` creates queues with optional dead-letter queues.
- `modules/ses` creates SES domain identities, DKIM tokens, and optional MAIL FROM domains.
- `environments/dev/terraform.tfvars.example` shows a starter environment config.
- `backend.tf.example` shows an optional remote state backend.

## First Run

```sh
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
terraform init
terraform plan -var-file=environments/dev/terraform.tfvars
```

To use remote state, copy `backend.tf.example` to `backend.tf`, update the bucket/table names, then run `terraform init`.

## SES DNS

The SES module outputs domain verification, DKIM, and MAIL FROM DNS values. Publish those records in your DNS provider after `terraform apply`, then AWS can complete verification.

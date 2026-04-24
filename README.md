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
```

To use remote state, copy `backend.tf.example` to `backend.tf`, update the bucket/table names, then re-run `terraform init`.

## Testing Before Apply

Run these three steps in order before applying any changes.

**1. Format check** — flags formatting issues without touching state:
```sh
terraform fmt -check -recursive
```

**2. Validate** — checks all references and module inputs are valid, no AWS calls made:
```sh
terraform validate
```

**3. Plan** — compares your config against real AWS state and shows what would change:
```sh
terraform plan -var-file=environments/<env>/terraform.tfvars
```

Review the plan output carefully, then apply when satisfied:
```sh
terraform apply -var-file=environments/<env>/terraform.tfvars
```

## SES DNS

The SES module outputs domain verification, DKIM, and MAIL FROM DNS values. Publish those records in your DNS provider after `terraform apply`, then AWS can complete verification.

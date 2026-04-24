data "aws_region" "current" {}

resource "aws_ses_domain_identity" "this" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "this" {
  count = var.dkim_enabled ? 1 : 0

  domain = aws_ses_domain_identity.this.domain
}

resource "aws_ses_domain_mail_from" "this" {
  count = var.mail_from == null ? 0 : 1

  domain           = aws_ses_domain_identity.this.domain
  mail_from_domain = var.mail_from
}

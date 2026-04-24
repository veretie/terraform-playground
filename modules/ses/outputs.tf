output "domain" {
  description = "SES domain identity."
  value       = aws_ses_domain_identity.this.domain
}

output "verification_token" {
  description = "TXT value for SES domain verification."
  value       = aws_ses_domain_identity.this.verification_token
}

output "dkim_tokens" {
  description = "DKIM tokens for CNAME records."
  value       = var.dkim_enabled ? aws_ses_domain_dkim.this[0].dkim_tokens : []
}

output "mail_from_domain" {
  description = "Custom MAIL FROM domain."
  value       = var.mail_from
}

output "mail_from_mx_record" {
  description = "MX record value for the custom MAIL FROM domain."
  value       = var.mail_from == null ? null : "10 feedback-smtp.${data.aws_region.current.name}.amazonses.com"
}

output "mail_from_txt_record" {
  description = "TXT record value for SPF on the custom MAIL FROM domain."
  value       = var.mail_from == null ? null : "v=spf1 include:amazonses.com -all"
}

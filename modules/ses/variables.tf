variable "domain" {
  description = "Domain to verify in SES."
  type        = string
}

variable "mail_from" {
  description = "Optional custom MAIL FROM domain."
  type        = string
  default     = null
}

variable "dkim_enabled" {
  description = "Whether to create DKIM tokens for the SES identity."
  type        = bool
  default     = true
}

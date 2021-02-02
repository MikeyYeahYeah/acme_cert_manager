variable "dns_challenge" {
  type        = string
  description = "The DNS challenge type used to fulfill the request. See README for more details."
}

variable "domain" {
  type        = string
  description = "The domain to be registered with ACME IE example.com"
}

variable "email_address" {
  type        = string
  description = "The e-mail address used to register the certificate"
}

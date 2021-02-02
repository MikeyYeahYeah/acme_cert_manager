provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "acme_certificate" "certificate" {
  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = var.domain

  dns_challenge {
    provider = var.dns_challenge
  }
}

data "template_file" "fullchain_pem" {
  template = file("templates/fullchain.tpl")

  vars = {
    issuer_cert = acme_certificate.certificate.issuer_pem
    public_cert = acme_certificate.certificate.certificate_pem
  }
}

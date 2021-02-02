output "private_key" {
  value     = acme_certificate.certificate.private_key_pem
  sensitive = true
}

output "issuer_pem" {
  value     = acme_certificate.certificate.issuer_pem
  sensitive = true
}

output "certificate_pem" {
  value     = acme_certificate.certificate.certificate_pem
  sensitive = true
}

output "fullchain_pem" {
  value     = data.template_file.fullchain_pem.rendered
  sensitive = true
}

resource "local_file" "private_key" {
  content  = acme_certificate.certificate.private_key_pem
  filename = "domain_certs/private_key.pem"
}

resource "local_file" "issuer_pem" {
  content  = acme_certificate.certificate.issuer_pem
  filename = "domain_certs/issuer.pem"
}

resource "local_file" "certificate_pem" {
  content  = acme_certificate.certificate.certificate_pem
  filename = "domain_certs/certificate.pem"
}

resource "local_file" "fullchain_pem" {
  content  = data.template_file.fullchain_pem.rendered
  filename = "domain_certs/fullchain.pem"
}


resource "github_organization_webhook" "github-webhook" {

  configuration {
    url          = "http://f9b5-67-246-237-199.ngrok.io"
    content_type = "application/json"
    insecure_ssl = false
    secret       = var.github_organization_webhook_secret
  }

  active = true
  events = ["repository"]
}

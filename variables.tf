variable "github_organization_webhook_secret" {
  description = "github webhook demo organization webhook secret"
  default     = ""
  type        = string
  sensitive   = true
}

variable "github_api_token" {
  description = "GITHUB_TOKEN"
  default     = ""
  type        = string
  sensitive   = true
}

variable "github_api_owner" {
  description = "GITHUB_OWNER"
  default     = ""
  type        = string
  sensitive   = true
}
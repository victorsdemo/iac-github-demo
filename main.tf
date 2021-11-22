provider "github" {
  token = var.github_api_token
  owner = var.github_api_owner
}

# Retrieve information about the currently (PAT) authenticated user
data "github_user" "self" {
  username = ""
}

terraform {
  backend "remote" {
    organization = "VictorsDemo"
    workspaces {
      name = "iac-github-demo"
    }
  }
}

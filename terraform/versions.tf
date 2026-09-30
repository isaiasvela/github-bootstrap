terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  # Keep in sync with terraform_version in .github/workflows/ci.yml.
  # >= 1.6: CI-tested version; strcontains() used in variables.tf needs >= 1.5.
  required_version = ">= 1.6.0"
}
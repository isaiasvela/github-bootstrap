resource "github_repository" "repository" {
  name        = var.repo_name
  visibility  = var.repo_visibility
  description = var.repo_description
  auto_init = true
}
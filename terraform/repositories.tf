#checkov:skip=CKV_GIT_1: This module supports public repositories by design.
resource "github_repository" "repository" {
  name        = var.repo_name
  visibility  = var.repo_visibility
  description = var.repo_description
  auto_init   = true

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
}
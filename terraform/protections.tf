resource "github_branch_protection" "main_protection" {
  repository_id = github_repository.repository.name
  pattern       = "main"

  allows_force_pushes             = false
  allows_deletions                = false
  require_conversation_resolution = true

  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = var.required_approving_review_count
    dismiss_stale_reviews           = var.required_approving_review_count > 0
  }
}

resource "github_branch_protection" "develop_protection" {
  repository_id = github_repository.repository.name
  pattern       = github_branch.develop.branch

  allows_force_pushes             = false
  allows_deletions                = false
  require_conversation_resolution = true

  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = var.required_approving_review_count
    dismiss_stale_reviews           = var.required_approving_review_count > 0
  }
}
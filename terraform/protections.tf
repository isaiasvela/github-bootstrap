resource "github_branch_protection" "main_protection" {
  repository_id = github_repository.repository.name
  pattern = "main"

  required_pull_request_reviews {
  }

  allows_force_pushes = false
  allows_deletions = false
  require_conversation_resolution = true
}

resource "github_branch_protection" "develop_protection" {
  repository_id = github_repository.repository.name
  pattern = github_branch.develop.branch

  required_pull_request_reviews {
  }

  allows_force_pushes = false
  allows_deletions = false
  require_conversation_resolution = true
}
resource "github_branch_protection" "main_protection" {
  repository_id = github_repository.repository.name
  pattern = "main"

  allows_force_pushes = false
  allows_deletions = false
  require_conversation_resolution = true
}

resource "github_branch_protection" "develop_protection" {
  repository_id = github_repository.repository.name
  pattern = github_branch.develop.branch

  allows_force_pushes = false
  allows_deletions = false
  require_conversation_resolution = true
}
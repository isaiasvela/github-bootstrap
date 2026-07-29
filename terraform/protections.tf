#checkov:skip=CKV_GIT_5: Required approvals depend on team size.
resource "github_branch_protection" "main_protection" {
  repository_id = github_repository.repository.name
  pattern       = "main"

  allows_force_pushes             = false
  allows_deletions                = false
  require_conversation_resolution = true

  require_signed_commits = true
}

#checkov:skip=CKV_GIT_5: Required approvals depend on team size.
resource "github_branch_protection" "develop_protection" {
  repository_id = github_repository.repository.name
  pattern       = github_branch.develop.branch

  allows_force_pushes             = false
  allows_deletions                = false
  require_conversation_resolution = true

  require_signed_commits = true
}
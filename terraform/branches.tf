resource "github_branch" "develop" {
  repository = github_repository.repository.name
  branch     = "develop"

  depends_on = [
    github_repository_file.README
  ]
}
resource "github_repository_file" "README" {
  repository          = github_repository.repository.name
  file                = "README.md"
  content             = file("../templates/README.md")
  commit_message      = "Add README.md file"
  overwrite_on_create = true
}

resource "github_repository_file" "LICENSE" {
  repository     = github_repository.repository.name
  file           = "LICENSE"
  content        = file("../templates/LICENSE")
  commit_message = "Add LICENSE file"
}
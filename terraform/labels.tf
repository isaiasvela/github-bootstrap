resource "github_issue_labels" "labels" {
  repository = github_repository.repository.name

  label {
    name = "bug"
    color = "d73a4a"
  }

  label {
    name = "documentation"
    color = "0075ca"
  }

  label {
    name = "enhancement"
    color = "a2eeef"
  }

  label {
    name = "feature"
    color = "0e8a16"
  }

  label {
    name = "security"
    color = "e11d21"
  }

  label {
    name = "dependencies"
    color = "cfd3d7"
  }

  label {
    name = "devops"
    color = "5319e7"
  }

  label {
    name = "good first issue"
    color = "7057ff"
  }

  label {
    name = "help wanted"
    color = "008672"
  }
}
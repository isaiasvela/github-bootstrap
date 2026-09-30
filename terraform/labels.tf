resource "github_issue_labels" "labels" {
  repository = github_repository.repository.name

  label {
    name        = "bug"
    description = "Something isn't working"
    color       = "d73a4a"
  }

  label {
    name        = "documentation"
    description = "Improvements or additions to documentation"
    color       = "0075ca"
  }

  label {
    name        = "enhancement"
    description = "Improvements to existing functionality"
    color       = "a2eeef"
  }

  label {
    name        = "feature"
    description = "New functionality"
    color       = "0e8a16"
  }

  label {
    name        = "security"
    description = "Security vulnerabilities or hardening"
    color       = "e11d21"
  }

  label {
    name        = "dependencies"
    description = "Pull requests that update a dependency"
    color       = "cfd3d7"
  }

  label {
    name        = "devops"
    description = "CI, infrastructure and automation"
    color       = "5319e7"
  }

  label {
    name        = "good first issue"
    description = "Good for newcomers"
    color       = "7057ff"
  }

  label {
    name        = "help wanted"
    description = "Extra attention is needed"
    color       = "008672"
  }
}
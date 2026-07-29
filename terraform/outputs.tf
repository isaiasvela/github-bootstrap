output "repo_url" {
  description = "The URL of the GitHub repository"
  value       = github_repository.repository.html_url
}

output "repo_ssh_clone_url" {
  description = "The SSH clone URL of the GitHub repository"
  value       = github_repository.repository.ssh_clone_url
}

output "repo_http_clone_url" {
  description = "The HTTP clone URL of the GitHub repository"
  value       = github_repository.repository.http_clone_url
}

output "repo_name" {
  description = "The name of the GitHub repository"
  value       = github_repository.repository.name
}

output "repo_visibility" {
  description = "The visibility of the GitHub repository"
  value       = github_repository.repository.visibility
}
variable "owner" {
  description = "GitHub owner (user or organization)"
  type        = string
}

variable "repo_name" {
  description = "Name of the GitHub repository"
  type        = string

  validation {
    condition     = !strcontains(var.repo_name, " ")
    error_message = "Repository names cannot contain spaces.\n Use '-' instead (e.g. recipe-manager)."
  }

  validation {
    condition     = length(trimspace(var.repo_name)) > 0
    error_message = "repo_name cannot be empty."
  }

  validation {
    condition     = length(trimspace(var.repo_name)) <= 100
    error_message = "repo_name cannot exceed 100 characters."
  }
}

variable "repo_visibility" {
  description = "Visibility of the GitHub repository"
  type        = string

  validation {
    condition     = contains(["public", "private"], var.repo_visibility)
    error_message = "repo_visibility must be either 'public' or 'private'."
  }
}

variable "repo_description" {
  description = "Description of the GitHub repository"
  type        = string
}
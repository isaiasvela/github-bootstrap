variable "owner" {
  description = "GitHub owner (user or organization)"
  type        = string

  validation {
    condition     = length(trimspace(var.owner)) > 0
    error_message = "owner cannot be empty."
  }

  validation {
    condition     = !strcontains(var.owner, " ")
    error_message = "owner cannot contain spaces."
  }
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

  validation {
    condition     = length(var.repo_description) <= 350
    error_message = "repo_description cannot exceed 350 characters (GitHub limit)."
  }
}

variable "template_owner" {
  description = "Owner of the template repository (user or organization)"
  type        = string
  default     = "isaiasvela"

  validation {
    condition     = length(trimspace(var.template_owner)) > 0
    error_message = "template_owner cannot be empty."
  }

  validation {
    condition     = !strcontains(var.template_owner, " ")
    error_message = "template_owner cannot contain spaces."
  }
}

variable "template_repository" {
  description = "Name of the template repository to use for creating the new repository"
  type        = string
  default     = "template-default"

  validation {
    condition     = length(trimspace(var.template_repository)) > 0
    error_message = "template_repository cannot be empty."
  }

  validation {
    condition     = !strcontains(var.template_repository, " ")
    error_message = "template_repository cannot contain spaces."
  }
}

variable "required_approving_review_count" {
  description = "Required approving reviews on main and develop (0 keeps current behaviour)"
  type        = number
  default     = 0

  validation {
    condition     = var.required_approving_review_count >= 0 && var.required_approving_review_count <= 6
    error_message = "required_approving_review_count must be between 0 and 6."
  }
}

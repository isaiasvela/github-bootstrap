# GitHub Bootstrap

Bootstrap GitHub repositories using Terraform and Infrastructure as Code.

## Overview

GitHub Bootstrap is a Terraform-based project that creates and configures GitHub repositories automatically.

The project currently provisions a new repository from a template, adds a local README file, creates a `develop` branch, applies branch protection rules, and configures a standard set of issue labels.

Current features include:

* Create a GitHub repository using the Terraform GitHub provider
* Initialize the repository from a template repository
* Add `README.md` from `templates/README.md`
* Create a `develop` branch
* Apply branch protection rules for `main` and `develop`
* Configure issue labels
* Validate input variables

---

## Project Structure

```text
.
├── terraform/
│   ├── branches.tf
│   ├── files.tf
│   ├── labels.tf
│   ├── outputs.tf
│   ├── protections.tf
│   ├── providers.tf
│   ├── repositories.tf
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── versions.tf
│
└── templates/
    └── README.md
```

---

## Requirements

* Terraform >= 1.0
* GitHub account with permission to create repositories
* GitHub Personal Access Token (PAT) or environment token

---

## Authentication

The GitHub provider reads the authentication token from the `GITHUB_TOKEN` environment variable.

PowerShell:

```powershell
$env:GITHUB_TOKEN="<your-token>"
```

Linux/macOS:

```bash
export GITHUB_TOKEN="<your-token>"
```

---

## Usage

1. Move into the Terraform directory:

```bash
cd terraform
```

2. Initialize Terraform:

```bash
terraform init
```

3. Review the execution plan:

```bash
terraform plan
```

4. Apply the configuration:

```bash
terraform apply
```
```

5. Destroy the managed resources when needed:

```bash
terraform destroy
```
```

---

## Terraform inputs

The project uses the following variables in `terraform/variables.tf`:

* `owner` — GitHub owner (user or organization)
* `repo_name` — Name of the repository to create
* `repo_visibility` — `public` or `private`
* `repo_description` — Repository description
* `template_owner` — Owner of the template repository
* `template_repository` — Template repository name

Set values in `terraform/terraform.tfvars` or pass them at runtime.

---

## Notes

* The repository is created with `auto_init = true`.
* A local `README.md` is added from `templates/README.md` after creation.
* Branch protection enforces signed commits and prevents force pushes and deletions on `main` and `develop`.

---

## Roadmap

* [x] Provider configuration
* [x] Repository creation
* [x] Variables and validation
* [x] Outputs
* [x] Branch management
* [x] Branch protection
* [x] Issue labels
* [x] GitHub Actions
* [x] Repository templates

---

## License

This project is released under the MIT License.

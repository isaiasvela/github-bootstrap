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
├── .checkov.yaml
├── scripts/
│   ├── reset-terraform.ps1
│   └── reset-terraform.sh
├── terraform/
│   ├── branches.tf
│   ├── files.tf
│   ├── labels.tf
│   ├── outputs.tf
│   ├── protections.tf
│   ├── providers.tf
│   ├── repositories.tf
│   ├── terraform.tfvars.example   # copy to terraform.tfvars (gitignored)
│   ├── variables.tf
│   └── versions.tf
│
└── templates/
    └── README.md
```

---

## Requirements

* Terraform >= 1.6
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

To keep the token out of your shell history, type it via a hidden prompt instead of pasting it on the command line:

```powershell
$secure = Read-Host "GitHub token" -AsSecureString
$env:GITHUB_TOKEN = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure))
```

```bash
read -rsp "GitHub token: " TOKEN && export GITHUB_TOKEN="$TOKEN" && unset TOKEN
```

If you use GitHub CLI: `export GITHUB_TOKEN="$(gh auth token)"`.

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

5. Destroy the managed resources when needed:

```bash
terraform destroy
```

> Warning: `destroy` deletes the GitHub repository permanently. Uncomment the `lifecycle { prevent_destroy = true }` block in `terraform/repositories.tf` if you want Terraform to refuse it.

---

## Terraform inputs

The project uses the following variables in `terraform/variables.tf`:

* `owner` — GitHub owner (user or organization)
* `repo_name` — Name of the repository to create
* `repo_visibility` — `public` or `private`
* `repo_description` — Repository description
* `template_owner` — Owner of the template repository
* `template_repository` — Template repository name
* `required_approving_review_count` — Required approving reviews on `main` and `develop` (`0`–`6`, default `0`)

Copy `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars` (gitignored, never commit it) and set values there, or pass them at runtime with `-var`:

```bash
cp terraform.tfvars.example terraform.tfvars
```

---

## Creating another repository

Terraform tracks what it manages in local state (`terraform.tfstate`). Changing `repo_name` and re-applying does not cleanly start a new bootstrap — reset the state first. Your existing repositories are kept: reset only clears Terraform's local record, it never deletes GitHub repositories.

1. Run the reset script (from the repo root):

```powershell
.\scripts\reset-terraform.ps1
```

```bash
chmod +x scripts/reset-terraform.sh  # first time only
./scripts/reset-terraform.sh
```

Or remove the state files manually (from `terraform/`):

```powershell
Remove-Item terraform.tfstate, terraform.tfstate.backup -Force -ErrorAction SilentlyContinue
```

```bash
rm -f terraform.tfstate terraform.tfstate.backup
```

2. Update `terraform.tfvars` with the new repository config and re-run `init` / `plan` / `apply`. If the provider or template changed since last time, refresh with `terraform init -upgrade`.

> Only if you no longer need the previous repository, delete it before resetting with `terraform destroy` (from `terraform/`). Otherwise skip this — created repositories stay untouched.

---

## Notes

* The repository is created with `auto_init = true`.
* A local `README.md` is added from `templates/README.md` after creation.
* Branch protection enforces signed commits and prevents force pushes and deletions on `main` and `develop`.
* `terraform/terraform.tfvars` and local state (`terraform.tfstate*`, `.terraform/`) are gitignored — never commit them.

---

## Roadmap

Completed:

* [x] Provider configuration, repository creation, variables and validation, outputs
* [x] Branch management, branch protection, issue labels
* [x] GitHub Actions, repository templates, state reset scripts
* [x] Input validations, tfvars example, destroy guardrail, configurable reviews
* [x] CI hardening (concurrency, path filters, shared Checkov config)
* [ ] Descriptions for issue labels
* [ ] Dependabot for GitHub Actions and provider updates

---

## License

This project is released under the MIT License.

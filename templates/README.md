# GitHub Bootstrap

Bootstrap GitHub repositories using Terraform and Infrastructure as Code.

## Overview

GitHub Bootstrap is a learning project focused on mastering Terraform while building a reusable repository bootstrapper.

The project automates the creation and configuration of GitHub repositories following a consistent structure and a set of best practices.

Current features include:

* Repository creation
* Branch management
* Branch protection rules
* Issue labels
* Repository templates (README, LICENSE)
* Configurable variables and outputs
* Input validation

Future versions will extend the project with GitHub Actions, repository secrets, reusable project templates and a command-line interface built with Bash and Python.

---

## Project Structure

```text
.
├── terraform/
│   ├── providers.tf
│   ├── versions.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── main.tf
│   └── terraform.tfvars
│
└── templates/
    ├── README.md
    └── LICENSE
```

---

## Requirements

* Terraform >= 1.0
* GitHub Personal Access Token (PAT)
* GitHub account

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

Move into the Terraform directory:

```bash
cd terraform
```

Initialize the project:

```bash
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Create the repository:

```bash
terraform apply
```

Destroy the managed resources:

```bash
terraform destroy
```

---

## Roadmap

* [x] Provider configuration
* [x] Repository creation
* [x] Variables and validation
* [x] Outputs
* [x] Branch management
* [x] Branch protection
* [x] Issue labels
* [x] Repository templates
* [ ] GitHub Actions
* [ ] Repository secrets
* [ ] Repository variables
* [ ] Reusable templates
* [ ] Bash CLI
* [ ] Python CLI
* [ ] Automated project bootstrap

---

## Learning Goals

This project is intended to learn:

* Terraform
* Infrastructure as Code (IaC)
* GitHub Provider
* GitHub API concepts
* CI/CD with GitHub Actions
* Bash automation
* Python automation

---

## License

This project is released under the MIT License.

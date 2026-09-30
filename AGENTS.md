# AGENTS.md

Single-purpose Terraform bootstrap: creates one GitHub repo per `terraform apply` run. No app code, no package manager.

## Log
- When you start, read `MEMORY.md` to understand the project’s status and the decisions that have been made.
- When you finish a task, update it: current status, important decisions (with the reasoning behind them), and pitfalls to avoid.
- Keep it brief (maximum ~50 lines): summarize or remove anything that is no longer relevant.
- If something becomes a permanent rule, suggest moving it to `AGENTS.md` instead of leaving it in the log.
- Never store sensitive data (passwords, tokens, personal information)

## Layout

- `terraform/` — all `.tf` files; run every `terraform` command from here (`files.tf` uses relative `../templates/README.md`).
- `templates/README.md` — placeholder pushed as `README.md` to each new repo via `github_repository_file.README`.
- `scripts/reset-terraform.*` — delete local state so the next `apply` bootstraps a new repo.
- `terraform/terraform.tfvars` holds per-repo config (gitignored, never commit); create it from the committed `terraform.tfvars.example`. No helper scripts — set `GITHUB_TOKEN` manually (see README Authentication).

## Commands

All Terraform work from `terraform/`:

```bash
cd terraform
terraform init
terraform plan
terraform apply   # creates repo + README + develop branch + protections + labels
terraform destroy # deletes the managed GitHub repo; do this BEFORE reset if repo is unwanted
```

Verify like CI (`.github/workflows/ci.yml`, runs with `working-directory: terraform`, Terraform 1.6.0):

```bash
cd terraform
terraform fmt -check
terraform init
terraform validate
tflint --init && tflint
```

`terraform fmt` must pass — CI fails on unformatted files. Checkov skips are intentional (`CKV_GIT_1,CKV_GIT_5` — public repos and 0-approval reviews are by design) and live in `.checkov.yaml` so local runs match CI. Docs-only pushes skip CI (paths filter); repeat pushes cancel prior runs (concurrency).

## Auth

No helper scripts (removed). Set `GITHUB_TOKEN` manually — hidden prompt preferred so it stays out of shell history (see README Authentication).

Provider (`terraform/providers.tf`) reads `GITHUB_TOKEN` implicitly; `owner = var.owner` only sets the target owner/org.

## One-repo-at-a-time state model

State is local (`terraform.tfstate`, gitignored). Changing `repo_name` and re-applying does NOT cleanly start a new bootstrap — reset first:

```powershell
# repo root
.\scripts\reset-terraform.ps1
```

```bash
# repo root
./scripts/reset-terraform.sh
```

- Reset deletes only `terraform.tfstate` + `.backup`; it never deletes the GitHub repo.
- Flow for repo N+1: (optional `terraform destroy` for repo N) → reset script → edit `terraform/terraform.tfvars` → `init/plan/apply`.
- `terraform.tfvars` is gitignored; create it from the committed `terraform.tfvars.example`, never commit the real one.

## Conventions / constraints

- `terraform.tfvars` variables (`variables.tf`): `repo_name` = no spaces, non-empty, ≤100 chars; `repo_visibility` = `public|private` only. Defaults: `template_owner="isaiasvela"`, `template_repository="template-default"`.
- New repos: `auto_init=true`, squash-only merges (`allow_squash_merge=true`, merge/rebase off), `develop` branch created after README (`branches.tf` `depends_on` the file resource — keep it).
- Protections on `main` + `develop`: signed commits required, no force-push/deletion, conversation resolution required. No required PR reviews, no `enforce_admins` (deliberate — Checkov/TRIVY flags expected).
- Labels are the fixed set in `terraform/labels.tf` (`github_issue_labels` manages the whole set — edits replace labels).
- Provider pin: `integrations/github ~> 6.0`, `required_version >= 1.6.0`; lockfile (`.terraform.lock.hcl`) is gitignored, so `init` resolves fresh.
- Line endings LF, final newline, trim whitespace (`.editorconfig`); `.gitattributes` forces LF for `*.sh` (shebang breaks with CRLF).

## Limits
- Always: update `MEMORY.md` at the end of a task.
- Ask before: new dependencies, new files and new data foramt changes.

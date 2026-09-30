# MEMORY.md — GitHub Bootstrap
Project history across sessions. Maximum ~50 lines: summarize or remove anything that is no longer relevant.

## Current Status
- v1 up and running: create repositories with the `develop` and `main` branches and their respective protection settings.
- Improvement batch: branches 1–3 merged (#10–#12). Item 10 N/A on develop (no review blocks at all — empty branch deleted, no PR). Branch 5 `feature/toolchain-pins` done, uncommitted (`required_version >= 1.6.0` + sync comment). fmt/init-upgrade/validate/tflint green.

## Lessons Learned and Pitfalls to Avoid
- `main` and `develop` have NO merge base (disconnected histories); final develop→main PR will show full-file diffs. Strategy deferred.
- README differs between `main` (287 lines, env/reset docs) and `develop` (146 lines, no scripts): always verify against the checked-out branch.
- `env.*` and `scripts/` exist only on `main`; develop removed them deliberately (#7). Docs must not reference them.
- `git checkout -- <file>` once dropped `.gitignore`'s trailing newline; restored. Keep tree clean.
- Windows box is PowerShell: no `tail`/`head`/`gh`; use `Select-Object -First N`. Local Terraform v1.14.5 (CI pins 1.6.0); provider resolves v6.13.0.
- Variable `validation` errors surface in `plan` before provider auth — testable with dummy `GITHUB_TOKEN` (unset afterwards).

## Decisions (and Why)
- 6 thematic feature branches (Q unanswered, default): docs, tfvars+validations+safety, reset-docs, protections, toolchain, CI. Sequential merges to avoid README conflicts.
- Respect #7: no helper scripts on develop; auth = manual export + hidden-prompt variants; reset = documented `rm` commands (branch 3).
- Protections: remove `dismiss_stale_reviews` (no-op with count=0), keep count=0.
- `AGENTS.md` ships in branch 1 docs PR.

## Next Steps
- Push branch 5, open PR to `develop` (no `gh` CLI on Windows box — via web UI).
- Branch 6: `feature/ci-hardening` (plan-on-PR question, checkov config, concurrency+paths).

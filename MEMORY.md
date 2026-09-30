# MEMORY.md — GitHub Bootstrap
Project history across sessions. Maximum ~50 lines: summarize or remove anything that is no longer relevant.

## Current Status
- v1 up and running: create repositories with the `develop` and `main` branches and their respective protection settings.
- Improvement batch (12 items, plan in `.opencode/plan/github-bootstrap-improvements.md`): branches 1–2 merged (#10, #11). Branch 3 `feature/reset-docs` done, uncommitted (reset scripts reintroduced from main + docs; #7 partially reversed for reset only, env.* stay out). PS script verified in temp sandbox.

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
- Push branch 3, open PR to `develop` (no `gh` CLI on Windows box — via web UI).
- Branch 4: `feature/protections-cleanup` (remove `dismiss_stale_reviews`, keep count=0).

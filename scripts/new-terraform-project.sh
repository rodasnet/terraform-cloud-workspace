#!/usr/bin/env bash
# new-terraform-project.sh - scaffold a new rodasnet Terraform project end to end.
#
# Usage:
#   ./new-terraform-project.sh <project-name> ["description"]
#
# <project-name> must match the <cloud>-<domain> convention already used by
# azure-platform, azure-policy, sandbox-rodasnet-com-site (lowercase,
# hyphen-separated, no "terraform-" prefix - that prefix is reserved for
# registry module repos).
#
# What this does:
#   1. Create rodasnet/<project-name> from the rodasnet/terraform-project-template
#      template repo and push it, with __PROJECT_NAME__ substituted.
#   2. Open a PR against rodasnet/terraform-cloud-workspace adding a workspace
#      definition (VCS-connected to the new repo).
#   3. Open a PR against rodasnet/azure-platform adding an OIDC identity entry
#      to config/workspace_identities.yaml (role_assignments left empty for
#      you to fill in - see that PR's description).
#
# Nothing here applies Terraform or merges anything. Every change past repo
# creation is a PR for you to review, same as the rest of this org's repos.
#
# Requires: gh (authenticated, repo+read:org scope), git, and local clones of
# rodasnet/terraform-cloud-workspace and rodasnet/azure-platform next to this
# script's own repo (../terraform-cloud-workspace, ../azure-platform relative
# to GH_ROOT below) - adjust GH_ROOT if your layout differs.

set -euo pipefail

PROJECT_NAME="${1:-}"
DESCRIPTION="${2:-TODO: describe this project}"

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 <project-name> [\"description\"]" >&2
  exit 1
fi

if [[ ! "$PROJECT_NAME" =~ ^[a-z][a-z0-9]*(-[a-z0-9]+)+$ ]]; then
  echo "error: '$PROJECT_NAME' doesn't look like <cloud>-<domain> (lowercase, hyphen-separated, e.g. azure-widget-service)" >&2
  exit 1
fi
if [[ "$PROJECT_NAME" == terraform-* ]]; then
  echo "error: the 'terraform-<provider>-<name>' naming pattern is reserved for registry module repos, not live projects. Pick a <cloud>-<domain> name instead." >&2
  exit 1
fi

# lowercase-hyphenated -> Title-Hyphenated, matching the existing
# examples/Azure-Platform.tf / Azure-Policy.tf naming convention.
TITLE_NAME="$(echo "$PROJECT_NAME" | awk -F- '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) substr($i,2)}; print}' OFS=-)"

GH="/mnt/c/Program Files/GitHub CLI/gh.exe"
WIN_GIT="/mnt/c/Program Files/Git/bin/git.exe"
GH_ROOT_WSL="/mnt/c/Users/Daniel Rodas/Documents/GitHub"
GH_ROOT_WIN='C:\Users\Daniel Rodas\Documents\GitHub'

NEW_REPO_WSL="$GH_ROOT_WSL/rodasnet/$PROJECT_NAME"
NEW_REPO_WIN="$GH_ROOT_WIN\\rodasnet\\$PROJECT_NAME"
TCW_WSL="$GH_ROOT_WSL/terraform-cloud-workspace"
TCW_WIN="$GH_ROOT_WIN\\terraform-cloud-workspace"
AP_WSL="$GH_ROOT_WSL/rodasnet/azure-platform"
AP_WIN="$GH_ROOT_WIN\\rodasnet\\azure-platform"

for d in "$TCW_WSL" "$AP_WSL"; do
  if [[ ! -d "$d" ]]; then
    echo "error: expected local clone at '$d' - adjust GH_ROOT_WSL/GH_ROOT_WIN at the top of this script if your layout differs." >&2
    exit 1
  fi
done

echo "== 1/3: creating rodasnet/$PROJECT_NAME from the template =="
"$GH" repo create "rodasnet/$PROJECT_NAME" \
  --private \
  --template rodasnet/terraform-project-template \
  --description "$DESCRIPTION"

# GitHub needs a moment to finish materializing a repo created from a template
# before it's clonable.
sleep 5

"$WIN_GIT" clone "https://github.com/rodasnet/$PROJECT_NAME.git" "$NEW_REPO_WIN"

sed -i "s/__PROJECT_NAME__/$PROJECT_NAME/g" "$NEW_REPO_WSL/backend.tf" "$NEW_REPO_WSL/README.md"

"$WIN_GIT" -C "$NEW_REPO_WIN" add backend.tf README.md
"$WIN_GIT" -C "$NEW_REPO_WIN" commit -m "chore: initialize from terraform-project-template

Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>"
"$WIN_GIT" -C "$NEW_REPO_WIN" push

echo "== 2/3: opening PR against terraform-cloud-workspace =="
TCW_BRANCH="onboard/$PROJECT_NAME"
"$WIN_GIT" -C "$TCW_WIN" fetch origin -q
"$WIN_GIT" -C "$TCW_WIN" checkout -B "$TCW_BRANCH" origin/main

cat > "$TCW_WSL/examples/$TITLE_NAME.tf" <<EOF
module "$TITLE_NAME" {
  source = "../"

  workspace_definition = {
    organization = var.organization
    name         = "$PROJECT_NAME"
    description  = "$DESCRIPTION"

    vcs_repo = {
      identifier     = "rodasnet/$PROJECT_NAME"
      branch         = "main"
      oauth_token_id = var.github_oauth_token_id
    }
  }
}
EOF

"$WIN_GIT" -C "$TCW_WIN" add "examples/$TITLE_NAME.tf"
"$WIN_GIT" -C "$TCW_WIN" commit -m "Add $PROJECT_NAME workspace definition

Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>"
"$WIN_GIT" -C "$TCW_WIN" push -u origin "$TCW_BRANCH"

TCW_PR_URL="$("$GH" pr create \
  --repo rodasnet/terraform-cloud-workspace \
  --base main --head "$TCW_BRANCH" \
  --title "Add $PROJECT_NAME workspace definition" \
  --body "Part of onboarding **rodasnet/$PROJECT_NAME** via the paved path.

Creates the \`$PROJECT_NAME\` HCP Terraform workspace, VCS-connected to \`rodasnet/$PROJECT_NAME\` main.

Merge order: this PR can merge independently, but \`$PROJECT_NAME\` won't plan cleanly until the companion PR to \`azure-platform\` (adding its OIDC identity) is also merged and applied.")"
echo "$TCW_PR_URL"

echo "== 3/3: opening PR against azure-platform =="
AP_BRANCH="onboard/$PROJECT_NAME"
"$WIN_GIT" -C "$AP_WIN" fetch origin -q
"$WIN_GIT" -C "$AP_WIN" checkout -B "$AP_BRANCH" origin/main

YAML_FILE="$AP_WSL/config/workspace_identities.yaml"
python3 - "$YAML_FILE" "$PROJECT_NAME" <<'PYEOF'
import sys
path, name = sys.argv[1], sys.argv[2]
with open(path) as f:
    text = f.read()
entry = f'''  {name}:
    project: "Default Project"
    role_assignments: []
    # ^ fill in from assignable_roles already granted to tfc-azure-platform
    # (see identity.tf) - Management Group Contributor / Cost Management
    # Contributor apply cleanly via PR. Any other role needs the one-time
    # manual bootstrap in docs/runbooks/bootstrap-permissions.md first.

'''
marker = "  # Added in the Track A PR once the subscription exists:"
if marker in text:
    text = text.replace(marker, entry + marker, 1)
else:
    text = text.rstrip("\n") + "\n\n" + entry
with open(path, "w") as f:
    f.write(text)
PYEOF

"$WIN_GIT" -C "$AP_WIN" add config/workspace_identities.yaml
"$WIN_GIT" -C "$AP_WIN" commit -m "identity: add $PROJECT_NAME OIDC entry (role_assignments TBD)

Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>"
"$WIN_GIT" -C "$AP_WIN" push -u origin "$AP_BRANCH"

AP_PR_URL="$("$GH" pr create \
  --repo rodasnet/azure-platform \
  --base main --head "$AP_BRANCH" \
  --title "identity: add $PROJECT_NAME OIDC entry" \
  --body "Part of onboarding **rodasnet/$PROJECT_NAME** via the paved path.

Federates the \`$PROJECT_NAME\` HCP Terraform workspace to Azure via OIDC (no
client secret). \`role_assignments\` is left empty - fill in before merging:

- roles already in \`tfc-azure-platform\`'s \`assignable_roles\` (currently
  Management Group Contributor, Cost Management Contributor - see
  \`identity.tf\`) apply cleanly through this PR's own merge + apply.
- any other role needs the one-time manual bootstrap in
  \`docs/runbooks/bootstrap-permissions.md\` **first**, before this PR can
  apply cleanly.

Companion PR (creates + VCS-connects the TFC workspace): see
rodasnet/terraform-cloud-workspace.")"
echo "$AP_PR_URL"

cat <<SUMMARY

== Done ==
New repo:        https://github.com/rodasnet/$PROJECT_NAME
Workspace PR:    $TCW_PR_URL
OIDC identity PR: $AP_PR_URL

Next steps (manual, by design - nothing above applied anything):
  1. Fill in subscription_id and role_assignments for $PROJECT_NAME.
  2. Review and merge both PRs (order doesn't matter, but $PROJECT_NAME
     won't plan cleanly until both are merged and applied).
  3. If role_assignments needs a role outside assignable_roles, run the
     docs/runbooks/bootstrap-permissions.md procedure in azure-platform
     before merging that PR.
SUMMARY

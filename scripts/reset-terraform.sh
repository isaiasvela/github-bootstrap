#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TERRAFORM_DIR="$(cd "$SCRIPT_DIR/../terraform" && pwd)"

cd "$TERRAFORM_DIR"

echo "Removing Terraform state..."

rm -f terraform.tfstate
rm -f terraform.tfstate.backup

echo "Terraform state removed."
echo
echo "You can now configure a new repository and run:"
echo "  terraform init"
echo "  terraform plan"
echo "  terraform apply"

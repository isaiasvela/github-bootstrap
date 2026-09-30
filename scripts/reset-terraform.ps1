$ErrorActionPreference = "Stop"

$TerraformDir = Join-Path $PSScriptRoot "..\terraform"
$TerraformDir = (Resolve-Path $TerraformDir).Path

Set-Location $TerraformDir

Write-Host "Removing Terraform state..."

Remove-Item "terraform.tfstate" -Force -ErrorAction SilentlyContinue
Remove-Item "terraform.tfstate.backup" -Force -ErrorAction SilentlyContinue

Write-Host "Terraform state removed."
Write-Host ""
Write-Host "You can now configure a new repository and run:"
Write-Host "  terraform init"
Write-Host "  terraform plan"
Write-Host "  terraform apply"

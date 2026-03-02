param(
  [Parameter(Mandatory = $true)]
  [string]$ManagementServer,

  [Parameter(Mandatory = $true)]
  [string]$ProviderOrg,

  [Parameter(Mandatory = $true)]
  [string]$Catalog,

  [Parameter(Mandatory = $false)]
  [string]$Space,

  [Parameter(Mandatory = $true)]
  [string]$Username,

  [Parameter(Mandatory = $false)]
  [string]$Realm = "provider/default-idp-2",

  [switch]$Execute
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Invoke-Apic {
  param(
    [Parameter(Mandatory = $true)]
    [string[]]$Args
  )

  $display = "apic " + ($Args -join " ")
  if (-not $Execute) {
    Write-Host "[DRY-RUN] $display" -ForegroundColor Yellow
    return
  }

  Write-Host "[RUN] $display" -ForegroundColor Cyan
  & apic @Args
  if ($LASTEXITCODE -ne 0) {
    throw "Command failed: $display"
  }
}

if (-not (Get-Command apic -ErrorAction SilentlyContinue)) {
  throw "APIC CLI not found in PATH. Install the IBM API Connect toolkit CLI first."
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$productFile = Join-Path $repoRoot "apic\product.yaml"

if (-not (Test-Path $productFile)) {
  throw "Missing product file: $productFile"
}

$password = Read-Host "APIC password for user '$Username'" -AsSecureString
$passwordPlain = [System.Net.NetworkCredential]::new("", $password).Password

Invoke-Apic -Args @(
  "login",
  "--server", $ManagementServer,
  "--realm", $Realm,
  "--username", $Username,
  "--password", $passwordPlain
)

$publishArgs = @(
  "products:publish",
  $productFile,
  "--server", $ManagementServer,
  "--org", $ProviderOrg,
  "--catalog", $Catalog
)

if ($Space) {
  $publishArgs += @("--space", $Space)
}

Invoke-Apic -Args $publishArgs

Write-Host ""
if ($Execute) {
  Write-Host "Publish finished. Verify API/Product status in API Manager." -ForegroundColor Green
} else {
  Write-Host "Dry-run finished. Re-run with -Execute to publish." -ForegroundColor Green
}

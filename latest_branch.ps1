#!/usr/bin/env pwsh

$programroot = "~\projects\linux_profile_files"
. "$programroot\common.ps1"
cd $programroot
git checkout -b "latest_$(Get-Date -Format "yyyy-MM-dd=hh-mm-ss")"

if([System.IO.File]::Exists($profile)) {
  Copy-Item $profile "$programroot\Microsoft.PowerShell_profile.ps1"
}

if([System.IO.File]::Exists("$HOME\_vimrc")) {
  Copy-Item "$HOME\_vimrc" "$programroot\.vimrc"
}

foreach($file in $PS_FILES) {
  if([System.IO.File]::Exists("$HOME\$file")) {
    Copy-Item "$HOME\$file" "$programroot\$file"
  }
}

echo "Latest branch created"

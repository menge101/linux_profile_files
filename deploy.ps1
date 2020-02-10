#!/usr/bin/env pwsh

$programroot = "~\projects\linux_profile_files"
. "$programroot\common.ps1"
cd $programroot

if([System.IO.File]::Exists("$profile.bak")) {
    Remove-Item "$profile.bak"
}
if([System.IO.File]::Exists($profile)) {
    Move-Item -Force $profile "$profile.bak"
}
Copy-Item Microsoft.PowerShell_profile.ps1 $profile

if([System.IO.File]::Exists("$HOME\_vimrc.bak")) {
    Remove-Item "$HOME\_vimrc.bak"
}
if([System.IO.File]::Exists("$HOME\_vimrc")) {
  Move-Item -Force "$HOME\_vimrc" "$HOME\_vimrc.bak"
}
Copy-Item "$programroot\.vimrc" "$HOME\_vimrc"

foreach($file in $PS_FILES) {
  if([System.IO.File]::Exists("$HOME\$file")) {
    Move-Item -Force "$HOME\$file" "$HOME\$file.bak"
  }
  Copy-Item "$programroot\$file" "$HOME\$file"
}

echo "Files deployed"

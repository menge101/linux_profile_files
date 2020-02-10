#!/usr/bin/env pwsh

$programroot = "~\projects\linux_profile_files"
. "$programroot\common.ps1"
cd $programroot

if(![System.IO.File]::Exists($profile)){
    Move-Item $profile "$profile.bak"
}
Copy-Item Microsoft.PowerShell_profile.ps1 $profile

if([System.IO.File]::Exists("$HOME\_vimrc")) {
  Move-Item "$HOME\_vimrc" "$HOME\_vimrc.bak"
}
Copy-Item "$programroot\.vimrc" "$HOME\_vimrc"

foreach($file in $PS_FILES) {
  if([System.IO.File]::Exists("$HOME\$file")) {
    Move-Item "$HOME\$file" "$HOME\$file.bak"
  }
  Copy-Item "$programroot\$file" "$HOME\$file"
}

echo "Files deployed"

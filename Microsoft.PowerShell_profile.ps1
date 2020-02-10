set-location c:\Users\nmenge
$env:Path += ";C:\Ruby27-x64\bin" # Add Ruby to path
$env:Path += ";C:\Program Files (x86)\Meld;C:\Program Files (x86)\Meld\lib" #add Meld to path
$host.ui.rawui.windowtitle="POWERSHELL - Menge"

. C:\Users\nmenge\powershell_aliases.ps1

ssh-add c:\Users\nmenge\.ssh\id_rsa

function prompt {
  $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
  $principal = [Security.Principal.WindowsPrincipal] $identity
  $symbolicref = git symbolic-ref HEAD
  if($symbolicref -ne $NULL) {
    $branch = "(" + $symbolicref.substring($symbolicref.LastIndexOf("/") +1) + ")"
  }
  else {
    $branch = ""
  }

  $(if (Test-Path variable:/PSDebugContext) { '[DBG-' }
    elseif($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { "[ADMIN-" }
    else { '[WZL-' }
  ) + "$(Get-Date -Format HH:mm:ss)]" + $branch + "@" + $(Get-Location) + "$(("=" * $NestedPromptLevel))" + "> "
}


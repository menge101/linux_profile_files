echo "Aliases Loaded"

function fingerprint-key {
  param ([parameter(Mandatory=$true,
                    Position=0,
                    HelpMessage="Enter hash algorithm, SHA1 or MD5 probably")]
         [string]$encoding,
         [parameter(Mandatory=$true,
                    Position=1,
                    HelpMessage="Enter path to key to be fingerprinted")]
         [ValidateScript({
            if(-Not ($_ | Test-Path) ){
                throw "File or folder does not exist"
            }
            if(-Not ($_ | Test-Path -PathType Leaf) ){
                throw "The Path argument must be a file. Folder paths are not allowed."
            }
            return $true
         })]
         [System.IO.FileInfo]$key_path)
  ssh-keygen -l -E $encoding -f $key_path
}

New-Alias which get-command

del alias:gp -Force
function git_current_branch {
  git branch | Where {$_ -match "\*\s+(.*)"} | Foreach {$Matches[1]}
}
function gp {
  $branch = git_current_branch
  git push --set-upstream origin $branch
}

function gd {
  $branch = git_current_branch
  git push origin ":$branch"
}

Set-Alias gpf "git push -f"
Set-Alias grp "git remote prune"
Set-Alias grpo "git remote prune origin"

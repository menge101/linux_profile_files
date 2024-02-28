#docker stuff
alias dps='docker ps'
alias d='docker'
alias dcclean='for image in $(dps --all -f status=exited -f status=created -q); do docker rm $image; done'
alias diclean='docker image prune -a'

# Python stuff
alias nuke_pyc='find . -name "*.pyc" -print0 | xargs -0 rm'
alias activate='source venv/bin/activate'
alias vv='python3 -m venv venv'

# git stuff
alias gp='git push --set-upstream origin $(git br | grep "*" | cut -d " " -f2)'
alias gpf='git push -f'
alias gd='git push origin :$(git br | grep "*" | cut -d " " -f2)'
alias grp='git remote prune'
alias grpo='git remote prune origin'

function git-retag {
if [ -z "$1" ]
    then
      echo "You must pass the tag as an argument"
      exit 0
fi
if [ "$1" eq production ]
    then
      read -p "Are you want to deploy production? " -n 1 -r
      echo    # (optional) move to a new line
      if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
          exit 0
      fi
fi

git tag -d $1 || echo "tag does not exist; creating"
git push origin :$1 || echo "tag does not exist on origin"
git tag -a $1 -m 'deploy'
git push --tags
}

# asdf stuff
alias a='asdf'
alias apa='asdf plugin-add'
alias ai='asdf install'
alias all='asdf list-all'
alias al='asdf list'

# cat aliases
alias ca='cat ~/.bash_aliases'
alias ea='mvim ~/.bash_aliases'

# Set finder settings ot not suck
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#notification
function task_status {
  if [ -z "$1" ]
  then
    task_name=job
  else
    task_name=$1
  fi
  if [ -z "$2" ]
  then
    status='done'
  else
    status=$2
  fi
  terminal-notifier -message $status -title $task_name
}

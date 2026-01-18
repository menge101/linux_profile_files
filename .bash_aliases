#docker stuff
alias dps='docker ps'
alias d='docker'
alias dcclean='for image in $(dps --all -f status=exited -f status=created -q); do docker rm $image; done'
alias diclean='docker image prune -a'

# Python stuff
alias nuke_pyc='find . -name "*.pyc" -print0 | xargs -0 rm'
alias vv='python3 -m venv venv'
alias act='activate'
alias dea='deactivate'
alias vnvrld='deactivate && activate'
function activate {
  if [ -d "$1" ]; then
    source "$1/bin/activate"
  elif [ -d "./venv" ]; then
    source venv/bin/activate
  elif [ -d "./.venv" ]; then
    source .venv/bin/activate
  else
    echo virtual env not found
  fi
}

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

alias awscopy='env | grep AWS | pbcopy'

#make ruff safer
function safe_ruff {
  if [ "$PWD" = "$HOME" ]
  then
    echo "ruff will not run in home dir"
    return 1
  fi
  if ! which ruff
  then
    echo "ruff not found, you probably don't have an active venv"
    return 1
  fi
  if ! git diff --name-only > /dev/null 2>&1
  then
    echo "ruff will not run outside of a git repo"
    return 1
  fi
  if [ "$1" = "format" ] &&  [ -z "$2" ]
  then
    for file in $(git diff --name-only | grep .py); do
      ruff format "$file"
    done
    return 0
  fi
  if [ "$1" = "format" ] && [ "$2" = "--all" ]
  then
    ruff format
    return 0
  fi
  ruff "$@"
}

alias awscopy='env | grep AWS | pbcopy'

#docker stuff
alias dmenv=' eval "$(docker-machine env default)"'
alias dps='docker ps'
alias dmstop='docker-machine stop dev'
alias dmstart='docker-machine start dev'
alias d='docker'
alias dm='docker-machine'
alias dcclean='for image in $(dps --all -f status=exited -f status=created -q); do docker rm $image; done'
alias diclean='docker image prune -a'

#docker login to artifacgtory
alias docker_login_to_artifactory='docker login https://upmce-docker-local-v2.jfrog.io -u mengen2@upmc.edu -p $(cat ~/.artifactory_key)'



#personal stuff
alias minis='for file in ./*_test.rb; do ruby $file; done'
alias profile='cd ~/projects/linux_profile_files'
alias cukes='rake cucumber'
alias rerun='rake cucumber:rerun'
alias prune='git remote prune origin'
#aliases for korra stuff
alias korra='docker run -v $(pwd)/crush-output:/app/scripts cwinters/korra'
alias korra_validate='d run -v $(pwd)/crush-output:/app/scripts cwinters/korra validate'
alias korra_report='d run -v $(pwd)/crush-output:/app/scripts cwinters/korra report'

# Python stuff
alias nuke_pyc='find . -name "*.pyc" -print0 | xargs -0 rm'
alias flake8='docker run --rm -v $(pwd):/app quay.io/lightside/flake8 /app'
alias activate='source venv/bin/activate'
alias vv='python -m venv venv'

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


# docker_for_mac
alias d4macvm='screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty'

#react native
alias crna='create-react-native-app'

# vagrant aliases
alias vu='vagrant up'
alias vd='vagrant destroy'
alias vp='vagrant provision'
alias vs='vagrant suspend'
alias vr='vagrant resume'
alias vs+='vagrant snapshot push'
alias vs-='vagrant snapshot pop'
alias vss='vagrant snapshot save'
alias vsr='vagrant snapshot restore'
alias vsl='vagrant snapshot list'
alias vsd='vagrant snapshot delete'

# AWS amplify
alias amp='amplify'

# asdf stuff
alias a='asdf'
alias apa='asdf plugin-add'
alias ai='asdf install'
alias all='asdf list-all'
alias al='asdf list'

#terraform stuff
alias tf='terraform'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfs='terraform show'
alias tfv='terraform validate'
alias tfr='terraform refresh'
alias tfi='terraform init'

# cat aliases
alias ca='cat ~/.bash_aliases'
alias ea='mvim ~/.bash_aliases'

# Set finder settings ot not suck
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# AWS SSO stuff
function refresh-sso {
    if [ -z "$1" ]
    then
      echo "You must pass the profile as an argument"
    else
      aws sso login --profile $1
      eval $(aws-sso-creds export --profile $1)
    fi
}
alias sso-creds='aws-sso-creds export --profile poc-admin'
alias awscopy='env | grep AWS | tr "\n" ";" | pbcopy'

function aws-unset {
    unset AWS_SESSION_TOKEN
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_ACCESS_KEY_ID
}


#NPM stuff
alias npm-lock='npm i --package-lock-only'

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

alias cfn-nag='docker run -v $(pwd):$(pwd) -w $(pwd) public.ecr.aws/upmce_cloudengineering/builderimage:v2.0.0 cfn_nag_scan --input-path'
alias checkov='docker run -v $(pwd):$(pwd) -w $(pwd) public.ecr.aws/upmce_cloudengineering/builderimage:v2.0.0 find ./cdk.out -name *.template.json -exec checkov -f {} \;'
alias cdk-val='aws cloudformation validate-template --template-body file://<( cdk synth )'

alias ea='mvim ~/.bash_aliases'
alias gcl='gitlab-ci-local'

# Global prptect crap

function gpkill {
  kill -9 $(ps -ef | grep GlobalProtect.app | awk 'NR==1{print $2}')
}

function gpup {
  open -a /Applications/GlobalProtect.app/Contents/MacOS/GlobalProtect
}

function gpdereg {
  launchctl stop com.paloaltonetworks.gp.pangps
  launchctl bootout gui/502/com.paloaltonetworks.gp.pangpa
}


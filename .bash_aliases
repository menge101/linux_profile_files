#docker stuff
alias dmenv=' eval "$(docker-machine env default)"'
alias dps='docker ps'
alias dmstop='docker-machine stop dev'
alias dmstart='docker-machine start dev'
alias d='docker'
alias dm='docker-machine'
alias dcclean='for image in $(dps --all -f status=exited -f status=created -q); do docker rm $image; done'
alias diclean='docker image prune -a'

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
alias vv='virtualenv venv'

# git stuff
alias gp='git push --set-upstream origin $(git br | grep "*" | cut -d " " -f2)'
alias gpf='git push -f'
alias gd='git push origin :$(git br | grep "*" | cut -d " " -f2)'
alias grp='git remote prune'
alias grpo='git remote prune origin'

# docker_for_mac
alias d4macvm='screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty'

# Uatu aliases
alias drake='d run -it --rm --volume ~/.aws:/root/.aws --volume $(pwd)/features:/uatu/features sandboxnexus.arcadiaanalytics.com/io.arcadia/setti/uatu:latest rake'

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


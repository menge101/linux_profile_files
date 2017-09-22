#Turnitin aliases
#docker stuff
alias dmenv=' eval "$(docker-machine env default)"'
alias dps='docker ps'
alias dmstop='docker-machine stop dev'
alias dmstart='docker-machine start dev'
alias d='docker'
alias dm='docker-machine'
# python venv alias
# assumes root of a python project has a virtualenv named venv
alias activate='source venv/bin/activate'
alias vv='virtualenv venv'
#TSE stuff
alias gg='gulp --build prod --api https://dev.getlightbox.com'
alias gigan='cd ~/projects/lux/projects/gigan'
alias gstart='docker run -d --name gigan -p 9000:80 --volume $(pwd)/build:/usr/share/nginx/html lightside/gigan'
alias rodan='cd ~/projects/lux/projects/rodan'
alias mgz='cd ~/projects/mechagodzilla'
alias pyserv='python -m SimpleHTTPServer'
alias titan_launch='open ~/projects/titan/index.html'
alias lux='cd ~/projects/lux'
alias run_lux='LUX_ENV=dev rake run:services'
alias ptol='cd ~/projects/lux/projects/Ptolemy'
#TII stuff
alias redis='redis-server /usr/local/etc/redis.conf'
alias flake8='docker run --rm -v $(pwd):/app quay.io/lightside/flake8 /app'
#personal stuff
alias minis='for file in ./*_test.rb; do ruby $file; done'
alias profile='cd ~/projects/linux_profile_files'
alias cukes='rake cucumber'
alias rerun='rake cucumber:rerun'
alias rubymine='~/rubymine/RubyMine-current/bin/rubymine.sh&'
alias prune='git remote prune origin'
alias intellij='~/intellij/idea-current/bin/idea.sh&'
#aliases for korra stuff
alias korra='docker run -v $(pwd)/crush-output:/app/scripts cwinters/korra'
alias korra_validate='d run -v $(pwd)/crush-output:/app/scripts cwinters/korra validate'
alias korra_report='d run -v $(pwd)/crush-output:/app/scripts cwinters/korra report'
# Python stuff
alias nuke_pyc='find . -name "*.pyc" -print0 | xargs -0 rm'

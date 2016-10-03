#Turnitin aliases
#docker stuff
alias dmenv=' eval "$(docker-machine env dev)"'
alias dps='docker ps'
alias dmstop='docker-machine stop dev'
alias dmstart='docker-machine start dev'
alias d='docker'
alias dm='docker-machine'
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
#personal stuff
alias minis='for file in ./*_test.rb; do ruby $file; done'
alias profile='cd ~/projects/linux_profile_files'
alias cukes='rake cucumber'
alias rerun='rake cucumber:rerun'
alias rubymine='~/rubymine/RubyMine-current/bin/rubymine.sh&'
alias prune='git remote prune origin'
alias intellij='~/intellij/idea-current/bin/idea.sh&'


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
   if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
     . $LUNCHY_DIR/lunchy-completion.bash
   fi

# git tab completion (homebrew)
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

PS1='[\u@\h`__git_ps1` \w]\$ '

source ~/.bash_completion.d/rake.sh

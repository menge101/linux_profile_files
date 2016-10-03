
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# bash tab completion (homebrew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

PS1='[\u@\h`__git_ps1` \w]\$ '

source ~/bash_completion.d/rake
source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
source '/Users/nmenge/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/nmenge/google-cloud-sdk/completion.bash.inc'


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# bash tab completion (homebrew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

PS1='[\u@\h`__git_ps1` \w]\$ '

FILE=~/.bash_completion.d/rake.sh
if [ -f $FILE ]; then
    source $FILE
else
    echo "File $FILE not found."
fi

FILE=~/.bash_completion.d/.git-completion.bash
if [ -f $FILE ]; then
    source $FILE
    echo "Git completion loaded."
else
    echo "File $FILE not found."
fi

FILE=~/.bash_functions
if [ -f $FILE ]; then
    source $FILE
else
    echo "File $FILE not found."
fi

FILE=~/.bash_completion_functions
if [ -f $FILE ]; then
    source $FILE
else
    echo "File $FILE not found."
fi

FILE=~/.bashrc
if [ -f $FILE ]; then
    source $FILE
else
    echo "File $FILE not found."
fi


# add aws cli command completion
FILE='/usr/local/bin/aws_completer'
if [ -f $FILE ]; then
    complete -C $FILE aws
else
    echo "File $FILE not found."
fi

#setup git auto-completion


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias assume="source assume"

eval "$(/opt/homebrew/bin/brew shellenv)"

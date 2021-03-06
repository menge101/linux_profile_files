
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# bash tab completion (homebrew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

PS1='[\u@\h`__git_ps1` \w]\$ '

FILE=~/.bash_completion.d/rake.sh
if [ -f $FILE ]; then
    source $FILE
else
    echo "File $FILE not found."
fi

FILE=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -f $FILE ]; then
    source $FILE
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

# The next line updates PATH for the Google Cloud SDK.
FILE='/Users/nmenge/google-cloud-sdk/path.bash.inc'
if [ -f $FILE ]; then
    source $FILE
else
    echo "File $FILE not found."
fi

# The next line enables shell command completion for gcloud.
FILE='/Users/nmenge/google-cloud-sdk/completion.bash.inc'
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

# Setup ASDF for version management
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.bash_profile

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH" 
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
eval "$(jenv init -)"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export JAVA_HOME=$(jenv javahome)

. /usr/local/opt/asdf/asdf.sh

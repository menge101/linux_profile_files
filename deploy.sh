#!/bin/bash

source common.sh

#needed to prevent failure for ssh completion
if [ ! -f ~/.ssh/config ]; then
    touch ~/.ssh/config
fi

if [ ! $(which aws) ]; then
    if [ ! $(which pip3) ]; then
        brew install python3
        echo "Python3 installed"
    fi
    pip3 install awscli --upgrade --user
    echo "================================"
    echo "Add the following to .bash_profile"
    echo "export PATH=$(python3 -m site --user-base)/bin:\$PATH"
    echo "================================"
fi

#deploy all user root files
for f in $USER_ROOT_FILES 
do
  echo "Deploying $f"
  rsync ./$f ~/$f
done

#deploy autocompletion files
mkdir -p ~/.bash_completion.d
for f in $BASH_COMPLETION_FILES
do
  echo "Deploying ~/.bash_completion.d/$f"
  rsync ./$f ~/.bash_completion.d/$f
done

if command -v brew &> /dev/null; then
    brew bundle --file=Brewfile
fi

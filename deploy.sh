#!/bin/bash

source common.sh

#needed to prevent failure for ssh completion
if [ ! -f ~/.ssh/config ]; then
    touch ~/.ssh/config
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

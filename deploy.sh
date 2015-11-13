#!/bin/bash

#defintion of files to deploy to user root
USER_ROOT_FILES=".bash_aliases .bash_profile .bashrc .gitconfig .profile .vimrc"

#definition of files to deploy to autocomplete folder
BASH_COMPLETION_FILES="rake.sh"

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

#deploy rubymine icls
echo "Manually deploy rubymine config to ~/.RubyMine##/config/colors"

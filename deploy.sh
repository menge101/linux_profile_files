#!/bin/bash

#defintion of files to deploy to user root
USER_ROOT_FILES=".bash_aliases .bash_profile .bashrc .gitconfig .profile .vimrc"

#deploy all user root files
for f in $USER_ROOT_FILES 
do
  echo "Deploying $f"
  cp -b ./$f ~/$f
done

#deploy rubymine icls
echo "Manually deploy rubymine config to ~/.RubyMine##/config/colors"

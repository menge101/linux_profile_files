#!/bin/bash
cd ~/projects/linux_profile_files
git co -b latest_$(date +%Y-%m-%d=%H-%M-%S)

#defintion of files to pull to repo
USER_ROOT_FILES="startup.py .bashrc .bashrc_remote .bash_aliases .bash_functions .bash_profile .gitconfig .profile .vimrc"

#definition of files to deploy to autocomplete folder
BASH_COMPLETION_FILES="rake.sh sshs.sh"

for f in $USER_ROOT_FILES
do
  echo "Gathering latest changes from $f"
  rsync ~/$f ./$f
done

for f in $BASH_COMPLETION_FILES
do
  echo "Gathering latest changes from $f"
  rsync ~/.bash_completion.d/$f ./$f
done


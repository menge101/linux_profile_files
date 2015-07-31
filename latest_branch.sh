#!/bin/bash
cd ~/projects/linux_profile_files
git co -b latest_$(date +%Y-%m-%d=%H-%M-%S)

#defintion of files to pull to repo
USER_ROOT_FILES=".bash_aliases .bash_profile .bashrc .gitconfig .profile .vimrc"
RUBYMINE_LOC="~/.RubyMine70/config/colors"
RUBYMINE_FILE="Nate_modifications.icls"

for f in $USER_ROOT_FILES
do
  echo "Gathering latest changes from $f"
  rsync ~/$f ./$f
done

echo "Gatheirng latest changes from $RUBYMINE_FILE"
rsync $RUBYMINEFILE_LOC/$RUBYMINE_FILE ./$RUBYMINE_FILE

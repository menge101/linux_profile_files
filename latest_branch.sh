#!/bin/bash
cd ~/projects/linux_profile_files
git co -b latest_$(date +%Y-%m-%d=%H-%M-%S)

source common.sh

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

if command -v brew &> /dev/null; then
    brew bundle dump --force
fi

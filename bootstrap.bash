#!/bin/bash

# check prerequisites

if ! command -v brew &>/dev/null; then
  printf "\nError: Homebrew not installed\n\n"
  exit 1
fi

# cd into this script's dir
cd "$(dirname "${BASH_SOURCE}")" || exit

if [ "$2" != "--no-pull" ] && [ "$2" != "-n" ]; then
  printf "\n# Pulling latest changes...\n"
  if ! git pull; then
    printf "\nWarning: git failed pulling the latest version (see details above).\n\n"
  fi
fi

printf "# Syncing to home folder...\n"

function doSync() {
  #  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "init" --exclude "*.bash" --exclude "apply-settings.fish" --exclude "*.md" --exclude "*.txt" -av . ~
  ln -s ./.gitconfig ~/.gitconfig
  ln -s "/Users/hjrnunes/Library/Mobile Documents/com~apple~CloudDocs/Dev/ssh_config" /Users/hjrnunes/.ssh/config
  for d in "/Users/hjrnunes/Library/Mobile Documents/com~apple~CloudDocs/Dev/ks"/*; do
    ln -s "$d" ~/.ssh/
  done
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
  doSync
else
  read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doSync
  else
    printf "Aborted.\n\n"
    exit 0
  fi
fi
unset doSync

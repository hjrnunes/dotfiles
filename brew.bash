#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
# echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install more recent versions of some OS X tools
# brew tap homebrew/dupes
# brew install homebrew/dupes/grep
# brew tap josegonzalez/homebrew-php
# brew install php54
# brew install ruby

# Brew cask to install GUI applications.
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install java

# Install everything else
brew install ag
brew install git
brew install git-extras
brew install httpie
brew install curl
brew install wget
brew install htop
brew install groovy
brew install maven
brew install gradle
brew install leiningen
brew install liblinear
brew install mongodb
brew install readline
brew install s3cmd
brew install ssh-copy-id

# Remove outdated versions from the cellar
# brew cleanup
brew linkapps

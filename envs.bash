#!/usr/bin/env bash

printf "Installing pyenv...\n"

brew install openssl readline sqlite3 xz zli
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

curl https://pyenv.run | bash

printf "Installing sdkman...\n"

curl -s "https://get.sdkman.io" | bash
# shellcheck source=$HOME/.sdkman/bin/sdkman-init.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"

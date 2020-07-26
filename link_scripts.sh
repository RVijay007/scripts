 #!/bin/zsh

ln -s "$PWD/.zshrc" ~/.zshrc
ln -s "$PWD/remote.sh" /usr/local/bin/remote.sh
git config --global core.excludesfile .gitignore
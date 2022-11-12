# link all config files to their respective locations
ln -sv ~/.dotfiles/.zshrc ~/.zshrc
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sv ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sv ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# convert all files in /bin directory to executables
chmod +x ~/.dotfiles/bin/output-vscode-extensions
chmod +x ~/.dotfiles/bin/dotfiles-precommit-hook
chmod -c +x ~/.dotfiles/bin/install-vscode-extensions

# Make a copy of the pre-commit hook file on the .git/hooks directory
cp ~/.dotfiles/bin/dotfiles-precommit-hook ~/.dotfiles/.git/hooks/pre-commit

# brew install brewfile

# install all vscode extensions
"$HOME"/.dotfiles/bin/install-vscode-extensions
# link all config files to their respective locations
ln -sv ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sv ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Make a copy of the pre-commit hook file on the .git/hooks directory
# cp ~/.dotfiles/bin/dotfiles-precommit-hook ~/.dotfiles/.git/hooks/pre-commit

# install all vscode extensions
"$HOME"/.dotfiles/bin/install-vscode-extensions
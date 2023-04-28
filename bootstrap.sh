# link all config files to their respective locations
ln -sv ~/.dotfiles/.zshrc ~/.zshrc
ln -sv ~/.dotfiles/.zprofile ~/.zprofile
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sv ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sv ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# convert all files in /bin directory to executables. These are the files that will be used to bootstrap and for the repo. NOT ones that will be transferred to bootstrapped system
chmod +x ~/.dotfiles/bin/output-vscode-extensions
chmod +x ~/.dotfiles/bin/dotfiles-precommit-hook
chmod -c +x ~/.dotfiles/bin/install-vscode-extensions

# Make a copy of the pre-commit hook file on the .git/hooks directory
# idk if this is actually needed or cloning the repo already does it
# cp ~/.dotfiles/bin/dotfiles-precommit-hook ~/.dotfiles/.git/hooks/pre-commit

# brew install brewfile
# mas install all in brewfile
# precommit hook to either generate brewfile or run mas list

# create ~/bin folder and move all scripts in /scripts into there
mkdir ~/bin
ln -sv ~/.dotfiles/scripts/* ~/bin
# make them all executables
chmod +x ~/bin/brew-upgrade-monthly

# install all vscode extensions
"$HOME"/.dotfiles/bin/install-vscode-extensions
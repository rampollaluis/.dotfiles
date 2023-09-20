Goal:
- to have a raw sh script on a website or even a domain pointing to a github gist of a raw sh file that you can curl and will download the dotfiles repo, install brew, install ansible with brew and subsequently run all the ansible playbooks in the repo
  - run something like curl -sSL setup.mydomain.dev | bash on a new machine and everything in the machine is setup with minimal user effort
Current features:
- Precommit hook that generates and stages brewfile everytime you do a commit so that it is always kept up to date 
- Ansible playbook to change macos defaults. A list of all it's doing will be added
- Ansible playbook to install everything in Brewfile (this includes taps, casks, and even mas)
- .zshrc, .gitconfig, and .zprofile config files
- script that runs every time you start terminal that asks if you want to run brew upgrade if more than 30 days have passed since last time

Needed:
- playbook to link all scripts and config files
- finish setting up nvim
- macos Automator workflows
- change brew upgrade script to do cd ~/.dotfiles && brew bundle dump --force && brew bundle --file Brewfile so that the brewfile is always kept up to date even if no commits to this repository are made
# To use as starting template for future readme

setup ssh https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection 

after brew: setup ohmyzsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into home directory (clone with ssh; might need to set up keys)

3. Run boostraph.sh

4. Install ansible and run playbooks

5. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```
## TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a [bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).

## Initial configuration of a brand new Mac

Before starting, I completed Apple's mandatory macOS setup wizard (creating a local user account, and optionally signing into my iCloud account). Once on the macOS desktop, I do the following (in order):

  - Install Ansible (following the guide in [README.md](README.md))
  - **Sign in in App Store** (since `mas` can't sign in automatically)
  - Clone mac-dev-playbook to the Mac: `git clone git@github.com:geerlingguy/mac-dev-playbook.git`
  - Drop `config.yml` from `~/Dropbox/Apps/Config` to the playbook (copy over the network or using a USB flash drive).
  - Run the playbook with `--skip-tags post`.
    - If there are errors, you may need to finish up other tasks like installing 'old-fashioned' apps first (since I try to place Photoshop in the Dock and it can't be installed automatically). Then, run the playbook again ;)
  - Manual settings to automate someday:
    - System Preferences:
      - Accessibility > Display > Reduce transparency
    - Safari:
      - View > Show Status Bar
      - Preferences > Advanced > "Show full website address"
      - Preferences > Advanced > "Show Develop menu in menu bar"
    - Dock:
      - Add jgeerling, Downloads, Applications, and Video Projects folders
    - Terminal:
      - Preferences > Profiles > Set JJG-Term as the default theme
  - Symlink the synchronized `config.yml` into the playbook dir: `ln -s /Users/jgeerling/Dropbox/Apps/Config/mac-dev-playbook/config.yml /Users/jgeerling/Development/mac-dev-playbook/config.yml`

## To Wrap in Post-provision automation

# SSH setup.
ssh-keygen  # and create a default key to set up .ssh folder
sudo ln -s /Users/jgeerling/Dropbox/Apps/Config/ssh/config ~/.ssh/config
# TODO - Manually copy any shared SSH keys that are needed.

# Ansible setup.
sudo mkdir -p /etc/ansible
sudo ln -s /Users/jgeerling/Dropbox/Apps/Config/ansible/ansible.cfg /etc/ansible/ansible.cfg
sudo ln -s /Users/jgeerling/Dropbox/Apps/Config/ansible/hosts /etc/ansible/hosts
sudo ln -s /Users/jgeerling/Dropbox/VMs/roles /etc/ansible/roles
mkdir -p /Users/jgeerling/.ansible
ln -s /Users/jgeerling/Dropbox/Apps/Config/ansible/galaxy_token /Users/jgeerling/.ansible/galaxy_token
ln -s /Users/jgeerling/Dropbox/Apps/Config/ansible/mm-vault-password.txt /Users/jgeerling/.ansible/mm-vault-password.txt
ln -s /Users/jgeerling/Dropbox/VMs/ /Users/jgeerling/.ansible/collections

# Font setup.
cp ~/Dropbox/Apps/Config/Fonts/* ~/Library/Fonts/

# Vim setup.
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
cd ~/.vim/autoload
curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/scrooloose/nerdtree.git
```

## When formatting old Mac
  - Deauthorize Apple Music in iTunes/Music App
  - Follow Apple's guide (TODO)
  - Be sure all projects on old system (if still available) are commited and pushed to remote
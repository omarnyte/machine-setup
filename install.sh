# Xcode Comman Line Tools
xcode-select --install

# Homebrew
if ! type "$(which brew)"; then 
		echo "Homebrew is not installed. Installing now..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "Homebrew is already installed."
		echo
	fi
	echo "Updating Homebrew..."
	brew update	


#
# Dependencies
#

echo "Installing curl"
brew install curl

echo "Installing git"
brew install git

echo "Installing wget"
brew install wget

#
# Languages
#

# Node.JS
echo "Installing Node.js"
brew install node
echo "Installing Node Version Manager (NVM)"
brew install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Ruby
echo "Installing Ruby"
brew install ruby


#
# zsh
#

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Spaceship zsh prompt"
brew install spaceship

#  zsh plugins
echo "Installing zsh plugins..."
brew install autojump # https://github.com/wting/autojump#os-x
brew install zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#packages
brew install zsh-history-substring-search # https://github.com/zsh-users/zsh-history-substring-search#install
brew install zsh-syntax-highlighting # https://github.com/zsh-users/zsh-history-substring-search#install


#
# Tools
#

echo "Installing Neovim"
# https://github.com/neovim/neovim/wiki/Installing-Neovim#homebrew-on-macos-or-linux
brew install neovim

echo "Installing postgresql"
# https://www.postgresql.org/download/macosx/
brew install postgresql

#
# Dotfiles
#
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

########## Variables
dir=~/machine-setup/dotfiles # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".gitconfig .vimrc .zshrc"    # list of files/folders to symlink in homedir
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles
############################

########## Variables

dir=~/git/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
files=".vimrc .vim .config/i3 bin"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then
# create symlinks
for file in $files; do
    if ! [ -L ~/$file ]; then
		echo "Moving any existing dotfiles from ~ to $olddir"
		mv ~/$file ~/dotfiles_old/
		echo "Backed up $file"
		echo "Creating symlink to $file in $dir directory."
		ln -s $dir/$file ~/$file
	else
		echo "Symlink for $file already exists."
	fi
	echo "-------------------"
done

#echo "Downloading GRML .zshrc"
#wget -O ~/.zshrc https://raw.githubusercontent.com/grml/grml-etc-core/master/etc/zsh/zshrc 

cat << EOF
Requirements: Firefox, zsh
Vim:
- for vim-livedown, install npm install -g livedown
- for vim-powerline, run install.sh in .vim/bundle/fonts
- change terminal font to a powerline font
EOF

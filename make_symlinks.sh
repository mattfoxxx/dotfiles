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
files=".vimrc .vim bin .Xresources .config/i3 .config/polybar .config/libinput-gestures.conf"    # list of files/folders to symlink in homedir

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
		echo "Backing up existing dotfile/folder from ~/$file to $olddir"
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
Install packages:
- i3
- yaourt rxvt-unicode-better-wheel-scrolling
- yaourt polybar
- yaourt siji-git
- yaourt libinput-gestures:
  - requires libinput 
  - cp 30-touchpad.conf /etc/X11/xorg.conf.d/
  - ln -s /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

Vim:
- Requirements: Firefox, zsh
- $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
- for vim-livedown, install npm install -g livedown
- for vim-powerline, run install.sh in .vim/bundle/fonts
- change terminal font to a powerline font
- in vim :PluginInstall
EOF

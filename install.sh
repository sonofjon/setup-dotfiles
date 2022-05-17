#!/bin/bash

# GitHub

read -n1 -p "Clone repos? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    set current_dir = $PWD
    [ -d ~/dotfiles ] || mkdir ~/dotfiles
    cd ~/dotfiles

    # Bash
    read -n1 -p "Bash? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-bash.git
        git clone git@github.com:sonofjon/bash-history.git
    else
        echo "  Skipping..."
    fi

    # Git
    read -n1 -p "Git? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-git.git
    else
        echo "  Skipping..."
    fi

    # Emacs
    read -n1 -p "Emacs? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-emacs.git
        git clone git@github.com:sonofjon/config-aspell.git
    else
        echo "  Skipping..."
    fi

    # Vim
    read -n1 -p "Vim? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-vim.git
    else
        echo "  Skipping..."
    fi

    # X
    read -n1 -p "X? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-x.git
    else
        echo "  Skipping..."
    fi

    # WSL
    read -n1 -p "WSL? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-wsl.git
    else
        echo "  Skipping..."
    fi

    # Windows
    read -n1 -p "Windows? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-windows.git
    else
        echo "  Skipping..."
    fi

    cd $current_dir
fi

# Backup

echo
read -n1 -p "Back up config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then

    # Bash
    read -n1 -p "Bash? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."
    
	set -x
	[ -f ~/.profile ] && mv -i ~/.profile .profile.bak
	[ -f ~/.bash_profile ] && mv -i ~/.bash_profile .bash_profile.bak
	[ -f ~/.bashrc ] && mv -i ~/.bashrc .bashrc.bak
	[ -f ~/.bash_aliases ] && mv -i ~/.bash_aliases .bash_aliases.bak
	[ -f ~/.bash_prompt ] && mv -i ~/.bash_prompt .bash_prompt.bak
	[ -f ~/.bash_history ] && mv -i ~/.bash_history .bash_history.bak
	set +x
    else
        echo "  Skipping..."
    fi


    # Git
    read -n1 -p "Git? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -f ~/.gitconfig ] && mv -i ~/.gitconfig .gitconfig.bak
	[ -f ~/.gitignore ] && mv -i ~/.gitignore .gitignore.bak
	[ -f ~/.gitattributes ] && mv -i ~/.gitattributes .gitattributes.bak
	set +x
    else
        echo "  Skipping..."
    fi

    # Emacs
    read -n1 -p "Emacs? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -d ~/.emacs.d ] && mv -i ~/.emacs.d ~/.emacs.d.bak && mkdir ~/.emacs.d
	[ -f ~/.aspell.en.prepl ] && mv -i ~/.aspell.en.prepl ~/.aspell.en.prepl.bak
	[ -f ~/.aspell.en.pws ] && mv -i ~/.aspell.en.pws ~/.aspell.en.pws.bak
	[ -f ~/.aspell.sv.prepl ] && mv -i ~/.aspell.sv.prepl ~/.aspell.sv.prepl.bak
	[ -f ~/.aspell.sv.pws ] && mv -i ~/.aspell.sv.pws ~/.aspell.sv.pws.bak
	set +x
    else
        echo "  Skipping..."
    fi

    # Vim
    read -n1 -p "Vim? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -f ~/.vimrc ] && mv -i ~/.vimrc ~/.vimrc.bak
	set +x
    else
        echo "  Skipping..."
    fi

    # X
    read -n1 -p "X? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -f ~/.Xresources ] && mv -i ~/.Xresources ~/.Xresources.bak
	set +x
    else
        echo "  Skipping..."
    fi

fi

# Link

echo
read -n1 -p "Link config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then

    # Bash
    read -n1 -p "Bash? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Linking..."

	set -x
	ln -s ~/dotfiles/config-bash/.profile ~/.profile
	ln -s ~/dotfiles/config-bash/.bashrc ~/.bashrc
	ln -s ~/dotfiles/config-bash/.bash_aliases ~/.bash_aliases
	ln -s ~/dotfiles/config-bash/.bash_prompt ~/.bash_prompt
	ln -s ~/dotfiles/bash-history/.bash_history ~/.bash_history
	set +x

	read -n1 -p "  Linux or Mac? (l/m): " && echo
	if [ "$REPLY" == "l" ]; then
            set -x
            ln -s ~/dotfiles/config-bash/.bashrc_linux ~/.bashrc_local
            set +x
	elif [ "$REPLY" == "m" ]; then
            set -x
            ln -s ~/dotfiles/config-bash/.bashrc_mac ~/.bashrc_local
            set +x
	fi

        echo "Warning: Distribution specific Bash files must be linked manually!"
    else
        echo "  Skipping..."
    fi

    # Git
    read -n1 -p "Git? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Linking..."

	set -x
	ln -s ~/dotfiles/config-git/.gitconfig ~/.gitconfig
	ln -s ~/dotfiles/config-git/.gitignore ~/.gitignore
	ln -s ~/dotfiles/config-git/.gitattributes ~/.gitattributes
	set +x
    else
        echo "  Skipping..."
    fi


    # Emacs
    read -n1 -p "Emacs? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Linking..."

	set -x
	[ ! -d ~/.emacs.d ] && mkdir ~/.emacs.d
	ln -s ~/dotfiles/config-emacs/init.el ~/.emacs.d/init.el
	ln -s ~/dotfiles/config-emacs/abbrev_defs ~/.emacs.d/abbrev_defs
	ln -s ~/dotfiles/config-aspell/.aspell.en.prepl ~/.aspell.en.prepl
	ln -s ~/dotfiles/config-aspell/.aspell.en.pws ~/.aspell.en.pws
	ln -s ~/dotfiles/config-aspell/.aspell.sv.prepl ~/.aspell.sv.prepl
	ln -s ~/dotfiles/config-aspell/.aspell.sv.pws ~/.aspell.sv.pws
	set +x
    else
        echo "  Skipping..."
    fi

    # Vim
    read -n1 -p "Vim? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Linking..."

	set -x
	ln -s ~/dotfiles/config-vim/.vimrc ~/.vimrc
	set +x
    else
        echo "  Skipping..."
    fi

    # X
    read -n1 -p "X? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Linking..."

	set -x
	ln -s ~/dotfiles/config-x/.Xresources ~/.Xresources
	set +x
    else
        echo "  Skipping..."
    fi

fi
    
echo
echo "Done!"

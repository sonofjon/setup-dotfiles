#!/bin/bash

# GitHub

echo -n "Clone repos? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    cd ~/dotfiles
    
    echo -n "Bash? (y/n): "
    read selection
    if [ "$selection" == "y" ]; then
        echo "Cloning..."
        git clone git@github.com:sonofjon/config-bash.git
        git clone git@github.com:sonofjon/bash-history.git
    else
        echo "Skipping..."      
    fi

    echo -n "Git? (y/n): "
    read selection
    if [ "$selection" == "y" ]; then
        echo "Cloning..."
        git clone git@github.com:sonofjon/config-git.git
    else
        echo "Skipping..."      
    fi

    echo -n "Emacs? (y/n): "
    read selection
    if [ "$selection" == "y" ]; then
        echo "Cloning..."
        git clone git@github.com:sonofjon/config-emacs.git
        git clone git@github.com:sonofjon/config-aspell.git
    else
        echo "Skipping..."      
    fi

    echo -n "X? (y/n): "
    read selection
    if [ "$selection" == "y" ]; then
        git clone git@github.com:sonofjon/config-x.git
    else
        echo "Skipping..."      
    fi

    echo -n "WSL? (y/n): "
    read selection
    if [ "$selection" == "y" ]; then
        git clone git@github.com:sonofjon/config-wsl.git
    else
        echo "Skipping..."      
    fi

    echo -n "Windows? (y/n): "
    read selection
    if [ "$selection" == "y" ]; then
        git clone git@github.com:sonofjon/config-windows.git
    else
        echo "Skipping..."      
    fi

    cd -
fi

# Bash

echo -n "Back up bash config files? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    echo "Backing up..."

    set -x
    mv ~/.profile .profile.bak
    mv ~/.bashrc .bashrc.bak
    mv ~/.bash_history .bash_history.bak
    # mv ~/.bash_aliases .bash_aliases.bak
    # mv ~/.bash_prompt .bash_prompt.bak
    set +x
fi

echo -n "Link bash config files? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    echo "Linking..."

    set -x
    ln -s ~/dotfiles/config-bash/.profile ~/.profile
    ln -s ~/dotfiles/config-bash/.bashrc ~/.bashrc
    ln -s ~/dotfiles/bash-history/.bash_history ~/.bash_history
    ln -s ~/dotfiles/config-bash/.bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/bash-history/.bash_prompt ~/.bash_prompt
    set +x

    echo "Warning: .bashrc_local support not set up"
fi

# Git

echo -n "Back up git config files? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    echo "Backing up..."

    set -x
    mv ~/.gitconfig .gitconfig.bak
    mv ~/.gitignore .gitignore.bak
    mv ~/.gitattributes .gitattributes.bak
    set +x
fi

echo -n "Link git config files? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    echo "Linking..."

    set -x
    ln -s ~/dotfiles/config-git/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/config-git/.gitignore ~/.gitignore
    ln -s ~/dotfiles/config-git/.gitattributes ~/.gitattributes
    set +x
fi

# Emacs

echo -n "Back up Emacs config files? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    echo "Backing up..."
    
    set -x
    mv ~/.emacs.d/init.el ~/.emacs.d/init.el.bak
    set +x

    echo "Warning: aspell support not set up"
fi

echo -n "Link Emacs config files? (y/n): "
read selection

if [ "$selection" == "y" ]; then
    echo "Linking..."

    set -x
    ln -s ~/dotfiles/config-emacs/init.el ~/.emacs.d/init.el
    set +x

    echo "Warning: aspell support not set up"
fi

echo "Done!"

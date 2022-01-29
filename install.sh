#!/bin/bash

# GitHub

read -n1 -p "Clone repos? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    set current_dir = $PWD
    cd ~/dotfiles
    
    read -n1 -p "Bash? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        echo "Cloning..."
        git clone git@github.com:sonofjon/config-bash.git
        git clone git@github.com:sonofjon/bash-history.git
    else
        echo "Skipping..."      
    fi

    read -n1 -p "Git? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        echo "Cloning..."
        git clone git@github.com:sonofjon/config-git.git
    else
        echo "Skipping..."      
    fi

    read -n1 -p "Emacs? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        echo "Cloning..."
        git clone git@github.com:sonofjon/config-emacs.git
        git clone git@github.com:sonofjon/config-aspell.git
    else
        echo "Skipping..."      
    fi

    read -n1 -p "X? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-x.git
    else
        echo "Skipping..."      
    fi

    read -n1 -p "WSL? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-wsl.git
    else
        echo "Skipping..."      
    fi

    read -n1 -p "Windows? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-windows.git
    else
        echo "Skipping..."      
    fi

    cd $current_dir
fi

# Bash

echo
read -n1 -p "Back up bash config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    echo "Backing up..."

    set -x
    [ -f ~/.profile ] && mv -i ~/.profile .profile.bak
    [ -f ~/.bash_profile ] && mv -i ~/.bash_profile .bash_profile.bak
    [ -f ~/.bashrc ] && mv -i ~/.bashrc .bashrc.bak
    [ -f ~/.bash_history ] && mv -i ~/.bash_history .bash_history.bak
    [ -f ~/.bash_aliases ] && mv -i ~/.bash_aliases .bash_aliases.bak
    [ -f ~/.bash_prompt ] && mv -i ~/.bash_prompt .bash_prompt.bak
    set +x
fi

read -n1 -p "Link bash config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    echo "Linking..."

    set -x
    ln -s ~/dotfiles/config-bash/.profile ~/.profile
    ln -s ~/dotfiles/config-bash/.bashrc ~/.bashrc
    ln -s ~/dotfiles/bash-history/.bash_history ~/.bash_history
    ln -s ~/dotfiles/config-bash/.bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/bash-history/.bash_prompt ~/.bash_prompt
    set +x

    read -n1 -p "Linux or Mac? (l/m): " && echo
    if [ "$REPLY" == "l" ]; then
        set -x
        ln -s ~/dotfiles/config-bash/.bashrc_linux ~/.bashrc_local
        set +x
    elif [ "$REPLY" == "m" ]; then
        set -x
        ln -s ~/dotfiles/config-bash/.bashrc_mac ~/.bashrc_local
        set +x
    fi
fi

# Git

echo
read -n1 -p "Back up git config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    echo "Backing up..."

    set -x
    [ -f ~/.gitconfig ] && mv -i ~/.gitconfig .gitconfig.bak
    [ -f ~/.gitignore ] && mv -i ~/.gitignore .gitignore.bak
    [ -f ~/.gitattributes ] && mv -i ~/.gitattributes .gitattributes.bak
    set +x
fi

echo
read -n1 -p "Link git config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    echo "Linking..."

    set -x
    ln -s ~/dotfiles/config-git/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/config-git/.gitignore ~/.gitignore
    ln -s ~/dotfiles/config-git/.gitattributes ~/.gitattributes
    set +x
fi

# Emacs

echo
read -n1 -p "Back up Emacs config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    echo "Backing up..."
    
    set -x
    [ -f ~/.emacs.d/init.el ] && mv -i ~/.emacs.d/init.el ~/.emacs.d/init.el.bak
    [ -f ~/.aspell.en.prepl ] && mv -i ~/.aspell.en.prepl ~/.aspell.en.prepl.bak
    [ -f ~/.aspell.en.pws ] && mv -i ~/.aspell.en.pws ~/.aspell.en.pws.bak
    set +x
fi

echo
read -n1 -p "Link Emacs config files? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    echo "Linking..."

    set -x
    ln -s ~/dotfiles/config-emacs/init.el ~/.emacs.d/init.el
    ln -s ~/dotfiles/config-aspell/.aspell.en.prepl ~/.aspell.en.prepl
    ln -s ~/dotfiles/config-aspell/.aspell.en.pws ~/.aspell.en.pws
    set +x
fi

echo
echo "Done!"

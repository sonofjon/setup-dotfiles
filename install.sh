#!/bin/bash
# shellcheck disable=SC2162

WINDOWS_USERNAME=$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d '\r')
PATH_POWERSHELL=/mnt/c/Users/${WINDOWS_USERNAME}/Documents/WindowsPowerShell
PATH_WINDOWS_TERMINAL=/mnt/c/Users/${WINDOWS_USERNAME}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState

# GitHub

read -n1 -p "Clone repos? (y/n): " && echo

if [ "$REPLY" == "y" ]; then
    current_dir="$PWD"
    [ -d ~/dotfiles ] || mkdir ~/dotfiles
    cd ~/dotfiles || exit

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
        git clone git@github.com:sonofjon/config-spelling.git
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

    # Windows
    read -n1 -p "Windows? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-windows.git
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

    # PowerShell
    read -n1 -p "PowerShell? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-powershell.git
    else
        echo "  Skipping..."
    fi

    # macOS
    read -n1 -p "macOS? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
        git clone git@github.com:sonofjon/config-macos.git
    else
        echo "  Skipping..."
    fi

    cd "$current_dir" || exit
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
	[ -f ~/.profile ] && mv -i ~/.profile ~/.profile.bak
	[ -f ~/.bash_profile ] && mv -i ~/.bash_profile ~/.bash_profile.bak
	[ -f ~/.bashrc ] && mv -i ~/.bashrc ~/.bashrc.bak
	[ -f ~/.bash_aliases ] && mv -i ~/.bash_aliases ~/.bash_aliases.bak
	[ -f ~/.bash_logout ] && mv -i ~/.bash_logout ~/.bash_logout.bak
	[ -f ~/.bash_prompt ] && mv -i ~/.bash_prompt ~/.bash_prompt.bak
	[ -f ~/.bash_history ] && mv -i ~/.bash_history ~/.bash_history.bak
	set +x
    else
        echo "  Skipping..."
    fi

    # Git
    read -n1 -p "Git? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -f ~/.gitconfig ] && mv -i ~/.gitconfig ~/.gitconfig.bak
	[ -f ~/.gitconfig.delta ] && mv -i ~/.gitconfig.delta ~/.gitconfig.delta.bak
	[ -f ~/.gitignore ] && mv -i ~/.gitignore ~/.gitignore.bak
	[ -f ~/.gitattributes ] && mv -i ~/.gitattributes ~/.gitattributes.bak
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
	[ -f ~/.hunspell_personal ] && mv -i ~/.hunspell_personal ~/.hunspell_personal.bak
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

    # Windows
    read -n1 -p "Windows? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -f $PATH_POWERSHELL/Microsoft.PowerShell_profile.ps1 ] && mv -i $PATH_POWERSHELL/Microsoft.PowerShell_profile.ps1 $PATH_POWERSHELL/Microsoft.PowerShell_profile.ps1.bak
	set +x
    else
        echo "  Skipping..."
    fi

    # WSL
    read -n1 -p "WSL? (y/n): " && echo
    if [ "$REPLY" == "y" ]; then
	echo "Backing up..."

	set -x
	[ -f $PATH_WINDOWS_TERMINAL/settings.json ] && mv -i $PATH_WINDOWS_TERMINAL/settings.json $PATH_WINDOWS_TERMINAL/settings.json.bak
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
	# ln -s ~/.profile ~/.bash_profile
	ln -s ~/dotfiles/config-bash/.bashrc ~/.bashrc
	ln -s ~/dotfiles/config-bash/.bash_aliases ~/.bash_aliases
	ln -s ~/dotfiles/config-bash/.bash_logout ~/.bash_logout
	ln -s ~/dotfiles/config-bash/.bash_prompt ~/.bash_prompt
	ln -s ~/dotfiles/bash-history/.bash_history ~/.bash_history
	set +x

	read -n1 -p "  Linux, Mac or WSL? (l/m/w): " && echo
	if [ "$REPLY" == "l" ]; then
            set -x
            ln -s ~/dotfiles/config-bash/.bashrc_linux ~/.bashrc_system
            set +x
	elif [ "$REPLY" == "m" ]; then
            set -x
            ln -s ~/dotfiles/config-bash/.bashrc_mac ~/.bashrc_system
            set +x
	elif [ "$REPLY" == "w" ]; then
            set -x
            ln -s ~/dotfiles/config-bash/.bashrc_wsl ~/.bashrc_system
            ln -s ~/dotfiles/config-bash/.profile_wsl ~/.profile_system
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
	ln -s ~/dotfiles/config-git/.gitconfig.delta ~/.gitconfig.delta
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
	ln -s ~/dotfiles/config-emacs/early-init.el ~/.emacs.d/early-init.el
	ln -s ~/dotfiles/config-emacs/lisp ~/.emacs.d/lisp
	ln -s ~/dotfiles/config-emacs/data ~/.emacs.d/data
	ln -s ~/dotfiles/config-emacs/abbrev_defs ~/.emacs.d/abbrev_defs
	ln -s ~/dotfiles/config-emacs/bookmarks ~/.emacs.d/bookmarks
	ln -s ~/dotfiles/config-spelling/.aspell.en.prepl ~/.aspell.en.prepl
	ln -s ~/dotfiles/config-spelling/.aspell.en.pws ~/.aspell.en.pws
	ln -s ~/dotfiles/config-spelling/.aspell.sv.prepl ~/.aspell.sv.prepl
	ln -s ~/dotfiles/config-spelling/.aspell.sv.pws ~/.aspell.sv.pws
	ln -s ~/dotfiles/config-spelling/.hunspell_personal ~/.hunspell_personal
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

    # Windows
    read -n1 -p "Windows? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Copying..."

        [ -d $PATH_POWERSHELL ] || mkdir -p $PATH_POWERSHELL

	set -x
	cp -f ~/dotfiles/config-powershell/Microsoft.PowerShell_profile.ps1 $PATH_POWERSHELL
	set +x
    else
        echo "  Skipping..."
    fi

    # WSL
    read -n1 -p "WSL? (y/n): " && echo

    if [ "$REPLY" == "y" ]; then
	echo "Copying..."

        [ -d $PATH_WINDOWS_TERMINAL ] || mkdir -p $PATH_WINDOWS_TERMINAL
        [ -d ~/bin ] || mkdir ~/bin

	set -x
	cp -f ~/dotfiles/config-wsl/LocalState/settings.json $PATH_WINDOWS_TERMINAL
	ln -s ~/dotfiles/config-backup/wsl/backup.sh ~/bin/backup.sh
	set +x
    else
        echo "  Skipping..."
    fi
fi
    
echo
echo "Done!"
echo
echo "Now consider cloning and running apps-linux, apps-winget, apps-homebrew, setup-python and/or setup-node."

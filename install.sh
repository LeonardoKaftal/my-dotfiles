#!/bin/bash

# Function to check if the package is installed and install it if necessary
install_package() {
    local package_name=$1

    # Check the package manager and verify if the package is installed
    if command -v apt &>/dev/null; then
        if dpkg -l | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo apt update && sudo apt install -y --skip-unavailable $package_name"
    elif command -v dnf &>/dev/null; then
        if dnf list installed | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo dnf install -y --skip-unavailable $package_name"
    elif command -v yum &>/dev/null; then
        if yum list installed | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo yum install -y --skip-unavailable $package_name"
    elif command -v pacman &>/dev/null; then
        if pacman -Q | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo pacman -Syu --noconfirm --skip-unavailable $package_name"
    elif command -v zypper &>/dev/null; then
        if zypper search --installed-only $package_name | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo zypper install -y --skip-unavailable $package_name"
    elif command -v apk &>/dev/null; then
        if apk info | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo apk add --skip-unavailable $package_name"
    elif command -v emerge &>/dev/null; then
        if emerge -p $package_name | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo emerge --skip-unavailable $package_name"
    elif command -v nix-env &>/dev/null; then
        if nix-env -q | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="nix-env -iA nixpkgs.$package_name --skip-unavailable"
    elif command -v pkg &>/dev/null; then
        if pkg info | grep -q $package_name; then
            echo "Package $package_name is already installed. No action required."
            return
        fi
        install_cmd="sudo pkg install -y --skip-unavailable $package_name"
    else
        echo "ERROR: Package manager not supported"
        exit 1
    fi

    echo "Installing: $install_cmd"
    $install_cmd || {
        echo "Error while executing command: $install_cmd"
        exit 1
    }
}

# Function to remove existing symlinks, if any
remove_existing_symlink() {
    local symlink=$1
    if [ -L "$symlink" ]; then
        echo "Removing existing symlink: $symlink"
        sudo rm -f "$symlink"
    elif [ -d "$symlink" ]; then
        echo "Removing existing directory: $symlink"
        sudo rm -rf "$symlink"
    fi
}

# Function to create symbolic links and exit if it fails
create_symlink() {
    local target=$1
    local link=$2
    echo "Creating symlink: $link -> $target"
    sudo ln -sf "$target" "$link" || {
        echo "Error: Failed to create symlink $link -> $target"
        exit 1
    }
}

# Main script execution
install_package "neovim tmux kitty"
install_package "compat-lua compat-lua-devel compat-luarocks"
install_package "fzf"

# Create symbolic links, removing existing ones first
remove_existing_symlink ~/.config/nvim
create_symlink ~/my-dotfiles/nvim ~/.config/

remove_existing_symlink ~/.tmux.conf
remove_existing_symlink ~/tmux/.tmux
create_symlink ~/my-dotfiles/.tmux.conf ~/
create_symlink ~/my-dotfiles/.tmux ~/tmux

# Clone TPM (Tmux Plugin Manager) if not already present, and handle errors
echo "Cloning Tmux Plugin Manager (TPM) into ~/.tmux/plugins/tpm..."
sudo rm -r '~/.tmux/plugins'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || {
    echo "Error: TPM clone failed. Please ensure Git is configured correctly. Tmux plugin configuration may be incomplete, but continuing script execution."
}

tmux source ~/.tmux.conf

remove_existing_symlink ~/.config/kitty
create_symlink ~/my-dotfiles/terminal/kitty ~/.config/

# Reload Kitty configuration
kill -SIGUSR1 $KITTY_PID

# Tmux sessionizer: remove existing symlink and create it in the global path
if [ -e ~/my-dotfiles/scripts/tmux-sessionizer ]; then
    sudo chmod +r ~/my-dotfiles/scripts/tmux-sessionizer
    remove_existing_symlink /usr/local/bin/tmux-sessionizer
    create_symlink ~/my-dotfiles/scripts/tmux-sessionizer /usr/local/bin
else
    echo "Error: ~/my-dotfiles/scripts/tmux-sessionizer not found!"
    exit 1
fi

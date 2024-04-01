#!/bin/bash

error() {
  echo "[ERROR] $1"
  exit 1
}

# install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# enable multilib for steam
sudo vim /etc/pacman.conf
sudo pacman -Syu

# install packages
yes | yay -S --needed --noconfirm --answerdiff=None --answerclean=None - <~/.local/share/chezmoi/setup/aur_packages.txt

# initialise chezmoi
chezmoi init github.com/seshues/dotfiles || error "Failed to init chezmoi"

# install ohmyzsh and plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Getting ohmyz.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo ".oh-my-zsh already found, skipping."
fi

# install cargo
if ! command -v cargo &> /dev/null; then
	curl https://sh.rustup.rs -sSf | sh
fi

source $HOME/.cargo/env
source ~/.profile

curl https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

cargo binstall bob-nvim

bob install nightly
bob use nightly

# install vencord
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# install a slightly edited keymap
sudo cp ~/.local/share/chezmoi/setup/keymap/finner_ansi /usr/share/X11/xkb/symbols/finner_ansi
sudo cp ~/.local/share/chezmoi/setup/keymap/finner_ansi.map /usr/share/kbd/keymaps/i386/qwerty/finner_ansi.map
setxkbmap -layout finner_ansi

# git clone rose-pine for alacritty and rofi
git clone https://github.com/rose-pine/alacritty.git ~/.config/alacritty/rose-pine
cp ~/.config/alacritty/rose-pine/dist/rose-pine.toml ~/.config/alacritty/themes
yes | rm -r ~/.config/alacritty/rose-pine

git clone https://github.com/rose-pine/rofi ~/.config/rofi/rose-pine
cp ~/.config/rofi/rose-pine/rose-pine.rasi ~/.config/rofi/
yes | rm -r ~/.config/rofi/rose-pine

# open vconsole.conf to change layout
sudo nvim /etc/vconsole.conf

# apply dotfiles with chezmoi
chezmoi apply -R || error "Failed to apply dotfiles"

# set zsh as shell
chsh -s /usr/bin/zsh

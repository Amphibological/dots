#!/run/current-system/sw/bin/sh

ln -s ./alacritty ~/.config/alacritty
ln -s ./feh ~/.config/feh
ln -s ./sxhkd ~/.config/sxhkd
ln -s ./bspwm ~/.config/bspwm
ln -s ./qutebrowser ~/.config/qutebrowser
ln -s ./rofi ~/.config/rofi
ln -s ./rofi-power ~/.config/rofi-power
ln -s ./polybar ~/.config/polybar

sudo ln -s ./configuration.nix /etc/nixos/
sudo ln -s ./vim.nix /etc/nixos/

#!/run/current-system/sw/bin/sh

ln -s ~/dots/alacritty ~/.config/alacritty
ln -s ~/dots/feh ~/.config/feh
ln -s ~/dots/sxhkd ~/.config/sxhkd
ln -s ~/dots/bspwm ~/.config/bspwm
ln -s ~/dots/qutebrowser ~/.config/qutebrowser
ln -s ~/dots/rofi ~/.config/rofi
ln -s ~/dots/rofi-power ~/.config/rofi-power
ln -s ~/dots/polybar ~/.config/polybar

sudo ln -s ~/dots/configuration.nix /etc/nixos/
sudo ln -s ~/dots/vim.nix /etc/nixos/

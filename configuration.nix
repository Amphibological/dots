{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/cachix.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.timeout = 2;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rivendell";
  networking.networkmanager.enable = true;

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  time.timeZone = "America/Toronto";

  hardware.acpilight.enable = true;

  security.sudo.wheelNeedsPassword = false;
  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty # terminal emulator

    qutebrowser # browsers
    firefox

    zathura # apps
    spotify

    feh # desktop environment
    polybarFull
    rofi  

    rustup # programming langs
    gcc
    nodejs
    nodePackages.typescript
    nodePackages.live-server

    git # cmdline tools
    killall
    direnv

    (import ./vim.nix)
  ];

  environment.shellAliases = {
    v = "vim";
    svim = "sudo vim";
    sv = "sudo vim";
  };

  fonts.fonts = with pkgs; [
    hack-font
    jetbrains-mono
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;
    windowManager.bspwm.enable = true;
    libinput.enable = true;
    libinput.naturalScrolling = true;
    xkbOptions = "ctrl:swapcaps";
  };

  console.useXkbConfig = true;

  programs.zsh = {
    enable = true;
    promptInit = ''
      PROMPT="(%F{blue}%~%F{white}): ";
      RPROMPT="%(?.. %F{red}%?%F{white})";
    ''; 
    syntaxHighlighting.enable = true;
    interactiveShellInit = ''
      eval "$(direnv hook zsh)"
    '';
  };

  programs.light.enable = true;
  programs.vim.defaultEditor = true;

  users.users.jch = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "20.03";

}


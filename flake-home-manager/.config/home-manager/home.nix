{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  targets.genericLinux.enable = true;

  imports = [ ./modules/module-bundle.nix ];
  work.enable = true;

  programs = {
    rofi = {
      enable = true;
      font = "FiraMono Nerd Font 14";
      theme = "sidebar";
    };
    firefox = {
      enable = false;
      profiles.morgan = {
        # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          ublock-origin
          sponsorblock
          darkreader
          vimium
        ];
      };
    };
  };

  services = {
    copyq.enable = true;
    flameshot.enable = true;
    syncthing.enable = true;
    gnome-keyring = {
      enable = true;
      components = [ "ssh" ];
    };
    ssh-agent.enable = true;
  };

  fonts.fontconfig.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Gui apps
    gimp
    keepassxc
    vlc

    # Fonts
    (nerdfonts.override { fonts = [ "FiraMono" "IosevkaTerm" ]; })

    # terminal stuff
    kitty
    tmux
    git
    lazygit
    starship
    direnv

    # Programming languages, sdks, stuff like that
    go
    gcc
    gnumake
    terraform

    # utils
    gh
    htop
    curl
    wget
    ripgrep
    fzf
    stow
    findutils
    distrobox
    libnotify
    restic
    bat
    traceroute
    sqlite
    fscrypt-experimental
    pandoc
    codespell
    kmonad

    # Desktop stuff
    i3
    i3lock
    playerctl
    polybarFull
    nitrogen
    picom
    dunst
    screenkey
    pulseaudioFull
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # neovim
  # TODO: Figure out how to use a git submodule/nix sub-flake here
}

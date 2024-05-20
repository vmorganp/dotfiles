{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  targets.genericLinux.enable = true;

  programs = {
    rofi = {
      enable = true;
      font = "FiraMono Nerd Font 14";
      theme = "sidebar";
    };
    firefox = {
      enable = true;
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
  home.packages = [
    # Gui apps
    pkgs.gimp
    pkgs.keepassxc
    pkgs.vlc

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraMono" "IosevkaTerm" ]; })

    # terminal stuff
    pkgs.kitty
    pkgs.tmux
    pkgs.git
    pkgs.lazygit
    pkgs.starship
    pkgs.direnv

    # Programming languages, sdks, stuff like that
    pkgs.go
    pkgs.gcc
    pkgs.gnumake
    pkgs.terraform

    # utils
    pkgs.gh
    pkgs.htop
    pkgs.curl
    pkgs.wget
    pkgs.ripgrep
    pkgs.fzf
    pkgs.stow
    pkgs.findutils
    pkgs.distrobox
    pkgs.libnotify
    pkgs.restic
    pkgs.bat
    pkgs.traceroute
    pkgs.sqlite
    pkgs.fscrypt-experimental
    pkgs.pandoc
    pkgs.codespell
    pkgs.kmonad

    # Desktop stuff
    pkgs.i3
    pkgs.i3lock
    pkgs.rofi
    pkgs.playerctl
    pkgs.polybarFull
    pkgs.nitrogen
    pkgs.picom
    pkgs.dunst
    pkgs.screenkey
    pkgs.pulseaudioFull
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # neovim
  # TODO: Figure out how to use a git submodule/nix sub-flake here
}

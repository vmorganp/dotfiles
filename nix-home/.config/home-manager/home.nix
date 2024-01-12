{ config, pkgs, ... }:

# All the options
# https://nix-community.github.io/home-manager/options.html
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  imports = [
  ] ++ (if builtins.pathExists  ~/.config/home-manager/profilePackages.nix then [ ~/.config/home-manager/profilePackages.nix ] else []);

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
  };

  services = {
    copyq = {
      enable = true;
    };
    flameshot = {
      enable = true;
    };
    syncthing = {
      enable = true;
    };
  };

  fonts.fontconfig.enable = true;


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Gui apps
    # pkgs.obsidian
    # pkgs.spotify # can't login, go use the flatpak
    pkgs.gimp
    # pkgsUnstable.librewolf
    pkgs.google-chrome # :(
    pkgs.keepassxc
    pkgs.vlc
    pkgs.thunderbird

    # Chatty things
    pkgs.discord


    # terminal tools
    # pkgs.alacritty # this has weird bugs and doesn't really work
    pkgs.tmux
    pkgs.neovim
    pkgs.lazygit
    pkgs.starship
    # pkgs.neovide # doesn't work as of 10 Oct 2023
    (pkgs.nerdfonts.override { fonts = ["FiraMono" "IosevkaTerm"];})
    # pkgs.docker # todo probably put more work into config for this

    # Programming languages, sdks, stuff like that
    pkgs.go
    pkgs.rustup
    pkgs.gcc
    pkgs.git
    pkgs.gnumake
    # (pkgs.python310.withPackages(ps: with ps; [ boto3 botocore pip])) # I have little faith
    pkgs.virtualenv
    # pkgs.packer

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

    # Desktop stuff
    pkgs.i3
    pkgs.playerctl
    pkgs.polybarFull
    pkgs.nitrogen
    pkgs.picom
    pkgs.dunst
    pkgs.screenkey
    ];

  programs.home-manager.enable = true;
}

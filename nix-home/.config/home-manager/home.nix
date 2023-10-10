{ config, pkgs, ... }:

# All the options
# https://nix-community.github.io/home-manager/options.html
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";

  targets.genericLinux.enable = true;

 # # ZSH setup
 #  programs.zsh = {
 #    enable = true;
 #    history = {
 #      path = "~/.zsh_history";
 #    };
 #    oh-my-zsh = {
 #      enable = true;
 #      plugins = [ "git" "aws" "gh" "fancy-ctrl-z"];
 #    };
 #    dotDir = "~/dotfiles/zsh";
 #  };

  programs = {
    rofi = {
      enable = true;
      font = "Droid Sans Mono 14";
      theme = "gruvbox-dark-hard";
    };
    # starship = {
    #   enable = true;
    # }
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
    pkgs.obsidian
    pkgs.spotify
    pkgs.gimp
    pkgsUnstable.librewolf
    pkgs.google-chrome # :(
    pkgs.keepassxc
    pkgs.vlc
    pkgs.thunderbird

    # Chatty things
    pkgs.discord

    # Work apps
    pkgs.awscli
    pkgs.teams-for-linux
    pkgs.trufflehog

    # terminal tools
    # pkgs.alacritty # this has weird bugs and doesn't really work
    pkgs.tmux
    pkgs.neovim
    pkgs.lazygit
    # pkgs.neovide # doesn't work as of 10 Oct 2023
    (pkgs.nerdfonts.override { fonts = ["DroidSansMono"];})
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
    pkgs.stow
    pkgs.findutils
    pkgs.distrobox
    pkgs.libnotify

    # Desktop stuff
    pkgs.i3
    pkgs.playerctl
    pkgs.polybarFull
    pkgs.nitrogen
    pkgs.picom
    pkgs.dunst
    pkgs.screenkey

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/morgan/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  targets.genericLinux.enable = true;

  programs = {
    # ssh.enable = true; # TODO: needs more debugging
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
    ssh-agent.enable = true; # TODO: needs more debugging
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/morgan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

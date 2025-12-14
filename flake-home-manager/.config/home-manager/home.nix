{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  targets.genericLinux.enable = true;

  imports = [ ./modules/module-bundle.nix ];
  # work.enable = true;
  custom-desktop.enable = true;

  programs.rofi = {
    enable=true;
    theme="dmenu";
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

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "DejaVuSansM Nerd Font Mono" ];
    };
  };

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
    obsidian

    # Fonts
    pkgs.nerd-fonts.dejavu-sans-mono
    pkgs.nerd-fonts.iosevka-term

    # terminal stuff
    tmux
    git
    neovim
    lazygit
    starship
    direnv
    neofetch
    tldr

    # Programming languages, sdks, stuff like that
    # go
    # gcc
    # gnumake

    # utils
    gh
    htop
    unixtools.ifconfig
    curl
    wget
    ripgrep
    fzf
    fd
    stow
    findutils
    distrobox
    libnotify
    restic
    bat # cat better
    traceroute
    sqlite
    fscrypt-experimental
    pandoc
    codespell
    # kmonad # Fancy keyboard stuff
    flatpak
    bfg-repo-cleaner
    dbeaver-bin
    nixfmt
    # custom Desktop stuff
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

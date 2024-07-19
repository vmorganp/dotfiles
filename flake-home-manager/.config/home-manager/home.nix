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
    rofi.enable = true;
    # firefox = {
    #   enable = false;
    #   profiles.morgan = {
    #     # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"
    #     extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
    #       bitwarden
    #       ublock-origin
    #       sponsorblock
    #       darkreader
    #       vimium
    #       reddit-enhancement-suite
    #     ];
    #   };
    # };
    # kitty = {
    #   enable = true;
    #   settings = {
    #     font_size = 15;
    #     italic_font = "IosevkaTerm NFM Italic";
    #     bold_italic_font = "IosevkaTerm NFM Bold Italic";
    #   };
    # };
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
    obsidian

    # Fonts
    (nerdfonts.override { fonts = [ "FiraMono" "IosevkaTerm" ]; })

    # terminal stuff
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
    kmonad # Fancy keyboard stuff
    flatpak
    bfg-repo-cleaner
    arandr

    # Desktop stuff
    i3
    i3lock
    rofi
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

  # Rice
  # To list theme options, run
  # nix build nixpkgs#base16-schemes&& ls ./result/share/themes
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    image = config.lib.stylix.pixel "base0A";
    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "FiraMono" ]; };
        name = "FiraMono Nerd Font Mono";
      };
      sizes = {
        applications = 11;
        desktop = 14;
        popups = 14;
      };
    };
    autoEnable = false;
    targets = {
      kitty.enable = true;
      firefox.enable = true;
      dunst.enable = true;
      gnome.enable = true;
      i3.enable = true;
      lazygit.enable = true;
      rofi.enable = true;
      tmux.enable = true;
      xresources.enable = true;
    };
  };

  # Polybar rice
  xdg.configFile."polybar/colors/base16.ini".text =
    "\n    [colors]\n    background = #${config.lib.stylix.colors.base00}\n    background-alt = #${config.lib.stylix.colors.base01}\n    foreground = #${config.lib.stylix.colors.base05}\n    primary = #${config.lib.stylix.colors.base0D}\n    secondary = #${config.lib.stylix.colors.base0B}\n    alert = #${config.lib.stylix.colors.base08}\n    disabled = #${config.lib.stylix.colors.base03}\n  ";
}

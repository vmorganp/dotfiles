{ config, pkgs, ... }:

# All the options
# https://nix-community.github.io/home-manager/options.html

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
      tray = {
        enable = true;
      };
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
    # have fun future me
    # https://github.com/nix-community/home-manager/issues/1439

    # Gui apps
    pkgs.obsidian
    pkgs.spotify
    pkgs.discord
    # pkgs.librewolf


    # terminal tools
    (pkgs.nerdfonts.override { fonts = ["DroidSansMono"];})
    pkgs.tmux
    pkgs.neovim
    pkgs.gh

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

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

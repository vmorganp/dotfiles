{ pkgs, lib, config, ... }: {
  options = {
    custom-desktop.enable = lib.mkEnableOption "enables custom desktop";
  };
  config = lib.mkIf config.custom-desktop.enable {
    home.packages = with pkgs; [
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
      arandr
    ];

    # stylix = {
    #   enable = true;
    #   base16Scheme = ./colors.yaml;
    #   image = config.lib.stylix.pixel "base0A";
    #   polarity = "dark";
    #   fonts = {
    #     monospace = {
    #       package = pkgs.nerd-fonts.dejavu-sans-mono;
    #       name = "DejaVuSansM Nerd Font Mono";
    #     };
    #     sizes = {
    #       applications = 11;
    #       desktop = 14;
    #       popups = 14;
    #     };
    #   };
    #   autoEnable = false;
    #   targets = {
    #     kitty.enable = true;
    #     firefox.enable = true;
    #     dunst.enable = true;
    #     gnome.enable = true;
    #     i3.enable = true;
    #     lazygit.enable = true;
    #     rofi.enable = true;
    #     tmux.enable = true;
    #     xresources.enable = true;
    #   };
    # };
    # Polybar rice
    # xdg.configFile."polybar/colors/base16.ini".text =
    #   "\n    [colors]\n    background = #${config.lib.stylix.colors.base00}\n    background-alt = #${config.lib.stylix.colors.base01}\n    foreground = #${config.lib.stylix.colors.base05}\n    primary = #${config.lib.stylix.colors.base0D}\n    secondary = #${config.lib.stylix.colors.base0B}\n    alert = #${config.lib.stylix.colors.base08}\n    disabled = #${config.lib.stylix.colors.base03}\n  ";
  };
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable grub cryptodisk
  boot.loader.grub.enableCryptodisk=true;

  boot.initrd.luks.devices."luks-9349a7ac-7b57-48b5-b63e-f9191d0e039d".keyFile = "/crypto_keyfile.bin";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Tell Xorg to use the nvidia driver (also valid for Wayland)
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  hardware.nvidia.open = false;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
	enable = true;
	noDesktop = true;
	enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce+i3";
    windowManager.i3.enable = true;
  };



  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Docker things
  virtualisation.docker.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.morgan = {
    isNormalUser = true;
    description = "morgan";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      # aPpLiCaTiOnS
      # firefox # browser
      librewolf # browser
      keepassxc # ssh key password manager
      spotify # music
      obsidian # proprietary notes app but I really like it, should probably take a look at logseq
      obs-studio # mostly for screen recordings, but way more versatile than that

      # Chatty things
      telegram-desktop
      signal-desktop
      discord

      # Nerd tools
      alacritty # terminal
      tmux # Terminal accessories
      oh-my-zsh # Terminal accessories
      starship # Terminal accessories
      gimp # image editor
      flameshot # screenshot
      ansible
      neovide # a neovim client that is entirely non-essential but very slick
      syncthing # file sync
    ];
  };

  services = {
	  syncthing = {
		  enable = true;
		  user = "morgan";
		  dataDir = "/home/morgan/Documents";
		  configDir = "/home/morgan/Documents/.config/syncthing";

	  };
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git" "fancy-ctrl-z" "gh" "aws"];
    };
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = ["DroidSansMono"];})
    ];


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = with pkgs; [
# Desktop stuff
      pkgs.xfce.xfce4-panel # desktop stuff
      pkgs.xfce.xfce4-i3-workspaces-plugin # desktop stuff
      pkgs.xfce.xfce4-pulseaudio-plugin # desktop stuff
      rofi # run launcher
      nitrogen # wallpaper setup
      pulseaudio # audio
      compton # transparency
      playerctl # media control
      i3 # window manager
      copyq

# General Utils
      neovim # editor
      stow # dotfiles handler
      ripgrep
      findutils # locate, out, and info
      wget # download stuff
      docker-compose
      htop # process viewer
      direnv # automagically do stuff when I cd into certain dirs
      jq # cli json parser

# programming utils
      rustup # rust programming language
      go # go programming language
      gcc # c compiler
      git
      gnumake # make support
      nodejs-18_x
      (python310.withPackages(ps: with ps; [ boto3 botocore pip]))
      virtualenv # python tooling
      gh # github tools, enables stuff like `gh checkout pr 42`
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

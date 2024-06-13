{ pkgs, lib, config, ... }: {
  options = { work.enable = lib.mkEnableOption "enables work"; };
  config = lib.mkIf config.work.enable {
    home.packages = with pkgs; [
      google-chrome
      awscli2
      aws-sam-cli
      trufflehog
      dbeaver
      packer
    ];
  };
}

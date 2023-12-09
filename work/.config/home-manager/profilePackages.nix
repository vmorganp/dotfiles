{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.awscli
    pkgs.teams-for-linux
    pkgs.trufflehog
    pkgs.dbeaver
    pkgs.packer
    # pkgs.postman # broken?
  ];
}

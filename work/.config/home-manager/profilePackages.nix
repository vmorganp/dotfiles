{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.awscli2
    pkgs.trufflehog
    pkgs.dbeaver
    pkgs.packer
    # pkgs.postman # broken?
  ];
}

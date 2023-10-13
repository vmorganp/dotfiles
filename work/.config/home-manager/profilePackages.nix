{ pkgs, ... }:
{
  home.packages = [
    pkgs.awscli
    pkgs.teams-for-linux
    pkgs.trufflehog
  ];
}

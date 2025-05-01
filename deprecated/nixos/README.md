# Some commands that are nice to have handy for nixos

# Pull updates
`sudo nix-channel --update`

# re-base the system from the declarative file
`sudo nixos-rebuild switch`

# Search for packages
`nix search nixpkgs <pkgname>`

# Delete old versions
## All old versions
`nix-env --delete-generations old`

## Older than some time period
`sudo nix-collect-garbage --delete-older-than 1d`

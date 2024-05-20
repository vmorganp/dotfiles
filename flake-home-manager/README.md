# THIS WAS COPIED BEFORE I MADE THIS A FLAKE SO IT'S PROBABLY KINDA WRONG

# Here's a bunch of stuff you have to run to get home-manager off the ground

1. clone dotfiles

   ```
   git clone https://github.com/vmorganp/dotfiles
   ```

2. Install home-manager

```
# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Install home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# Add unstable packages
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
nix-shell '<home-manager>' -A install
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
# Stow the home manager config here
home-manager switch
```

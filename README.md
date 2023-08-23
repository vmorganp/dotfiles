# Dotfiles
To install with stow, run:
```
stow -d ~/dotfiles -t ~ <thing you want>
```

or for nix conf, run:
```
stow -d ~/dotfiles -t /etc/nixos/ nixos
```

To uninstall with stow, run:
```
stow -d ~/dotfiles -D <thing you don't want>
```

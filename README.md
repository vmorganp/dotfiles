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

# Random notes on stuff that probably needs tweaked
## Browser

### Use google
I'm sorry
https://mycroftproject.com/install.html?id=14909&basename=google&icontype=ico&name=Google

### Addons
- Ublock
- Bitwarden
- Darkreader
- Vimium
    Vimium won't do `<Alt+Number>`
    Add rule:

    | pattern | keys      |
    | ------- | --------- |
    | \|      | 123456789 |


# Dotfiles
To install with stow, run from ~ 
```
stow -d ~/dotfiles -t ~ <thing you want>
```

to set all of this up, run
```
ansible-playbook ./all_others.yml --user $USER --ask-pass --ask-become-pass --connection=local --inventory 127.0.0.1,

```

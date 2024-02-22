# dotfiles

dotfiles for my current setup, managed with [chezmoi](https://chezmoi.io)   
keymap half-assedly 'ported' and modified from [finner](https://github.com/ruohola/finner) to work with my ansi keyboard, added less than and greater than signs under altgr comma and dot   
setup configured for arch

# install

**only apply dotfiles**   
```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply seshues
```

**complete installation**   
```shell
sh -c "$(curl -sS https://raw.githubusercontent.com/seshues/dotfiles/main/install.sh)"
```

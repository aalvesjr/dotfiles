# DotFiles

Just my configuration files

## How use

```
curl -sL https://raw.githubusercontent.com/aalvesjr/dotfiles/master/install.sh | sh
```

## Ignoring config files

This script will add the follow configurations to your .bashrc

  - alias
  - editor
  - go
  - heroku
  - ps1
  - rbenv

If you want do not use some these configurations, just create the file `.ignore` with the file names that will not be used.

```
# file .ignore

go
rbenv

```

with the example above, the configuration for `go` and `rbenv` will not be included in `.basrc`

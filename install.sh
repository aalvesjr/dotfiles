#!/bin/bash

DOTFILES_URL='https://github.com/aalvesjr/dotfiles.git'

echo "Cloning dotfiles from: ${DOTFILES_URL}"
git clone ${DOTFILES_URL} ~/.dotfiles

if [[ $? -eq 0 ]]; then

  mkdir ~/.dotfiles/old
  cd ~/

  echo "Configuring dotfiles..."

  for file in $(ls .dotfiles/files);
  do
    echo "~/${file}"
    if [ -s ~/.${file} ]; then mv ~/.${file} ~/.dotfiles/old/${file} ; fi

    ln -s ~/.dotfiles/files/${file} ~/.${file}
  done

  echo "Configuring bashrc..."
  if ! [ -s ~/.bashrc ]; then touch ~/.bashrc ; fi

  for file in $(ls .dotfiles/bashrc);
  do
    cat ~/.dotfiles/bashrc/${file} >> ~/.bashrc
  done

  echo "Configuring bash_profile..."
  if ! [ -s ~/.bash_profile ]; then touch ~/.bash_profile ; fi

  for file in $(ls .dotfiles/bash_profile);
  do
    cat ~/.dotfiles/bash_profile/${file} >> ~/.bash_profile
  done

  source ~/.bash_profile

  echo "Configured Dotfiles!"
fi

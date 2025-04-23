#!/bin/bash

if ! command -v stow 2>&1 >/dev/null; then
  echo 'Installing stow..'
  brew install stow
fi

echo 'Stow exists.. Setting up configuration..'
stow .

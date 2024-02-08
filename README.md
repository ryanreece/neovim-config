# Neovim Config

This repository contains my personal Neovim config which is based heavily on the [0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) YouTube video from [ThePrimeagen](https://www.youtube.com/@ThePrimeagen).

## Prerequisites

* Zsh
* Neovim > 0.9.x (need to build from source)
* [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
* [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

## Installation

* Clone the repo into `~/.config/nvim/`
* Ensure the prereqs are installed.
* Open nvim and run `:PackerSync`.

## Signing Commits with NeoVim and Fugitive

The `:!` operator in Nvim uses pipes and not a tty so therefore interactive processes such as entering a password don't work. To resolve this issue a couple of things need to be configured for processes such as GPG commit signing to work.

### Windows and WSL2

1. Ensure gpg is installed in WSL2: `sudo apt install gpg gnupg gpg-agent`
2. Ensure the gpg-agent plugin is installed in ohmyzsh
3. Install [GPG4Win](https://www.gpg4win.org/) is installed on the Windows side to handle password input.
4. Configure the cache ttls and pinentry-program within `~/.gnupg/gpg-agent.conf`.
```
default-cache-ttl 86400
max-cache-ttl 86400
pinentry-program "/mnt/c/Program Files (x86)/GnuPG/bin/pinentry-basic.exe"
```

### Ubuntu Native

...coming soon...

### MacOS

...coming soon...

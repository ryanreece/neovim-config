# Neovim Config

This repository contains my personal Neovim config which is based heavily on the [0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) YouTube video from [ThePrimeagen](https://www.youtube.com/@ThePrimeagen).

## Prerequisites

* Zsh
* [Neovim](https://github.com/neovim/neovim) > **0.9.x** ([need to build from source](https://github.com/neovim/neovim/blob/master/BUILD.md))
* [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)

## Installation

* Clone the repo into `~/.config/nvim/`
* Ensure the prereqs are installed.

## Signing Commits with NeoVim and Fugitive

Since the `:!` operator in Nvim uses pipes and not a tty, interactive processes such as entering a password to sign commits don't work. To sign commits using gpg and a password, a pinentry program needs to be configured on the system.

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

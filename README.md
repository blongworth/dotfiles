# dotfiles

Collection of dotfiles and scripts for various stuff.

directory structure set up for using GNU stow:

`stow vim` from root directory will symlink one directory up

## Installing

Installing the files needs the GNU [`stow`](http://www.gnu.org/software/stow/) command.

1. Clone this repo to ~/.dotfiles:
  `git clone https://github.com/gbirke/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. `./install_all.sh`

or install individual settings with `stow vim` etc.


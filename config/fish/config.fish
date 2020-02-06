# personal bin dir
# Keep this at the bottom to make sure $HOME/bin is the first entry
[ -e "$HOME/bin" ]; and set -g fish_user_paths $HOME/bin $fish_user_paths

#source ~/.config/fish/abbrevs.fish

# set nvim as the git editor
set -x GIT_EDITOR nvim

# short date on RHS prompt
set -g theme_date_format "+%a %H:%M"


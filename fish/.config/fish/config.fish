test ! -e "$HOME/.x-cmd.root/local/data/fish/rc.fish" || source "$HOME/.x-cmd.root/local/data/fish/rc.fish" # boot up x-cmd.
#
### GLOBAL VARIABLES
#

# Load private config
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/private.fish ]
    source $HOME/.config/fish/private.fish
end

# Editor
set -x EDITOR nvim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

switch (uname)
    case Linux
        set -x OSTYPE Linux
    case Darwin
        set -x OSTYPE MacOS
    case FreeBSD NetBSD DragonFly
        set -x OSTYPE FreeBSD
    case '*'
        set -x OSTYPE unknown
end

## ENV

# Fish 3.1+ doesn't add binaries to the path autmatically anymore
# https://github.com/fish-shell/fish-shell/issues/6594
contains /usr/local/bin $PATH
or set PATH /usr/local/bin $PATH
# On M1 Macs, homebrew installs things in /opt/homebrew
contains /opt/homebrew/bin
or set PATH /opt/homebrew/bin $PATH

if [ -f $HOME/.config/fish/env/index.fish ]
    source $HOME/.config/fish/env/index.fish
end

set -l __goroot_default /usr/lib/go
if test -d "$__goroot_default"
    set -gx GOROOT $__goroot_default
else
    set -e GOROOT
end

#
### ALIAS
#
# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

# Private aliases (e.g. with servers address...)
## aliases/private.fish will be ignored by git (.gitignore)
if [ -f $HOME/.config/fish/aliases/private.fish ]
    source $HOME/.config/fish/aliases/private.fish
end

# Git
if [ -f $HOME/.config/fish/aliases/git.fish ]
    source $HOME/.config/fish/aliases/git.fish
end

#
### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/fish_git_prompt.fish
#
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_show_informative_status yes
set __fish_git_prompt_showupstream yes

set -l cl_empress 757575
set -l cl_gainsboro E0E0E0
set -l cl_dodger_blue 297EF2
set -l cl_gorse FFEB3B
set -l cl_red_orange F52D2D
set __fish_git_prompt_color_branch $cl_gorse -b $cl_empress
set __fish_git_prompt_color_dirtystate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_invalidstate $cl_red_orange -b $cl_gainsboro
set __fish_git_prompt_color_stagedstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_cleanstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_stashstate $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color_upstream $cl_gainsboro -b $cl_empress
set __fish_git_prompt_color_untrackedfiles $cl_dodger_blue -b $cl_gainsboro
set __fish_git_prompt_color $cl_gainsboro -b $cl_empress

set __fish_git_prompt_char_cleanstate '  '
set __fish_git_prompt_char_dirtystate '  '
set __fish_git_prompt_char_invalidstate '  '
set __fish_git_prompt_char_stagedstate '  '
set __fish_git_prompt_char_stashstate '  '
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles '  '
set __fish_git_prompt_char_upstream_ahead '  '
set __fish_git_prompt_char_upstream_behind '  '
set __fish_git_prompt_char_upstream_diverged '  '
set __fish_git_prompt_char_upstream_equal '  '
set __fish_git_prompt_char_upstream_prefix ' '

#
### PROMPT
#

# Prompt colors (change these to customize your prompt theme)
# Options: blue, purple, green, cyan, orange, pink
#   blue:   1C55A2 428CF1 78A8F2
#   purple: 6B21A8 9333EA C084FC
#   green:  166534 22C55E 86EFAC
#   cyan:   0E7490 06B6D4 67E8F9
#   orange: C2410C F97316 FDBA74
#   pink:   BE185D EC4899 F9A8D4
set -g prompt_color_1 'eba0ac'
set -g prompt_color_2 'eba0ac'
set -g prompt_color_3 'eba0ac'
set -g prompt_cursor_color 'f5e0dc'

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

if status is-interactive
    fastfetch
end
# zoxide (--cmd cd replaces cd with smart jump)
zoxide init --cmd cd fish | source

# moonbit
fish_add_path "$HOME/.moon/bin"
fish_add_path /home/cc/.local/bin

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

# fzf.fish keybindings (Alt instead of Ctrl)
fzf_configure_bindings --directory=\ef --variables=\ev

# Yazi: Force Kitty Graphics Protocol for Ghostty terminal
if test "$TERM_PROGRAM" = "ghostty"
    set -gx YAZI_ADAPTER kgp
end

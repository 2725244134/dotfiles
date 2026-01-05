# Fish Shell Main Configuration
# Environment variables, prompt settings, and interactive tools are now in conf.d/
# This file only handles private config and alias loading

#
### PRIVATE CONFIGURATION
#
set -g fish_greeting (set_color E298A5)"i love you so"(set_color normal)
# Load private config (local settings or computer-specific config)
if test -f $HOME/.config/fish/private.fish
    source $HOME/.config/fish/private.fish
end

#
### ALIASES
#

# Main aliases
if test -f $HOME/.config/fish/aliases/main.fish
    source $HOME/.config/fish/aliases/main.fish
end

# Git aliases
if test -f $HOME/.config/fish/aliases/git.fish
    source $HOME/.config/fish/aliases/git.fish
end

if test -f $HOME/.config/fish/aliases/zellij.fish
    source $HOME/.config/fish/aliases/zellij.fish
end

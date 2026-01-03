# Fish Shell Main Configuration
# Environment variables, prompt settings, and interactive tools are now in conf.d/
# This file only handles private config and alias loading

#
### PRIVATE CONFIGURATION
#

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

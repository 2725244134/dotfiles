# Interactive Tools Initialization
# Only runs in interactive mode

# Skip if not in interactive mode
status is-interactive; or return

# Fastfetch - System info display on shell start
if command -q fastfetch
    fastfetch
end

# Zoxide - Smart directory jumping (replaces cd command)
if command -q zoxide
    zoxide init --cmd cd fish | source
end

# FZF - Fuzzy finder keybindings (Alt+F for directory, Alt+V for variables)
if command -q fzf
    fzf_configure_bindings --directory=\ef --variables=\ev
end

# Yazi - Terminal file manager with image preview
# Force Kitty Graphics Protocol for Ghostty terminal
if test "$TERM_PROGRAM" = "ghostty"
    set -gx YAZI_ADAPTER kgp
end

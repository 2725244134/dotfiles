function fish_user_key_bindings
    # Atuin: Alt+H for history search (instead of Ctrl+R)
    if command -q atuin
        bind \eh _atuin_search
        bind -M insert \eh _atuin_search
    end
end

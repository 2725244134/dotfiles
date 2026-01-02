# Press ESC twice to add sudo to the beginning of the command line
function fish_user_key_bindings
    bind \e\e --mode default 'fish_commandline_prepend sudo'
    bind \e\e --mode insert 'fish_commandline_prepend sudo'
end

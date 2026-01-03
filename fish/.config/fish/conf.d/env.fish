# Environment Variables Configuration

# Editor
set -gx EDITOR nvim
set -gx GIT_EDITOR $EDITOR
set -gx SUDO_EDITOR "rvim -u NONE"

# OS Type Detection
switch (uname)
    case Linux
        set -gx OSTYPE Linux
    case Darwin
        set -gx OSTYPE MacOS
    case FreeBSD NetBSD DragonFly
        set -gx OSTYPE FreeBSD
    case '*'
        set -gx OSTYPE unknown
end

# PATH Configuration
# Fish 3.1+ doesn't add binaries to the path automatically anymore
# https://github.com/fish-shell/fish-shell/issues/6594
contains /usr/local/bin $PATH
or set -gx PATH /usr/local/bin $PATH

fish_add_path "$HOME/.local/bin"

# Go Configuration
set -l __goroot_default /usr/lib/go
if test -d "$__goroot_default"
    set -gx GOROOT $__goroot_default
else
    set -e GOROOT
end

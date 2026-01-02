function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l color_cursor (set -q prompt_cursor_color; and echo $prompt_cursor_color; or echo 'F5F0E8')
    
    # First line: user and path
    printf '\n'
    set_color $color_cursor
    printf '┌─['
    set_color normal
    printf '%s' (whoami)
    set_color $color_cursor
    printf ']─'
    set_color 000000 -b $color_cursor
    printf ' %s ' (prompt_pwd)
    set_color normal
    set_color $color_cursor
    printf ''
    
    # Git branch if in repo
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l branch (command git symbolic-ref --short HEAD 2>/dev/null; or command git describe --tags --exact-match 2>/dev/null; or command git rev-parse --short HEAD 2>/dev/null)
        printf '─['
        set_color normal
        printf '%s' $branch
        set_color $color_cursor
        printf ']'
    end
    
    # Second line: prompt
    printf '\n'
    printf '└─'
    if test $last_status -ne 0
        set_color red
        printf '✗'
    else
        printf '─'
    end
    set_color $color_cursor
    printf '► '
    set_color normal
end

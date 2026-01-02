function fish_prompt_get_left_prompt --description 'Get first line left prompt content'
    # Use global prompt colors from config.fish, fallback to defaults
    set -l cl_1 (set -q prompt_color_1; and echo $prompt_color_1; or echo '1C55A2')
    set -l cl_2 (set -q prompt_color_2; and echo $prompt_color_2; or echo '428CF1')
    set -l cl_3 (set -q prompt_color_3; and echo $prompt_color_3; or echo '78A8F2')
    set -l cl_black '000000'
    set_color $cl_black -b $cl_1
    # If we are in a virtualenv, we display its name
    if set -q VIRTUAL_ENV; and set -q PYENV_VERSION
        printf '(%s)' $PYENV_VERSION
    end
    printf ' %s ' (whoami)
    set_color normal
    set_color $cl_1 -b $cl_2
    printf ''
    set_color $cl_black -b $cl_2
    if [ (prompt_pwd) = '~' ]
        printf '  ~ '
        set_color $cl_2 -b normal
        printf ''
    else if [ (prompt_pwd) = '/' ]
        printf '  / '
        set_color $cl_2 -b normal
        printf ''
    else
        printf '  '
        set_color $cl_2 -b $cl_3
        printf ''
        set_color $cl_black -b $cl_3
        printf ' %s ' (prompt_pwd)
        set_color $cl_3 -b normal
        printf ''
    end
    set_color normal
end

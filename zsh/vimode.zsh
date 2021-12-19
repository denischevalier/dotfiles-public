# Vi mode
bindkey -v
DEFAULT_VI_MODE=viins
KEYTIMEOUT=1

__set_cursor() {
    local style
    case $1 in
        reset) style=0;; # The terminal emulator's default
        blink-block) style=1;;
        block) style=2;;
        blink-underline) style=3;;
        underline) style=4;;
        blink-vertical-line) style=5;;
        vertical-line) style=6;;
    esac

    [ $style -ge 0 ] && print -n -- "\e[${style} q"
}

__set_vi_mode_cursor() {
    case $KEYMAP in
        vicmd)
          __set_cursor block
          ;;
        main|viins)
          __set_cursor vertical-line
          ;;
    esac
}

__get_vi_mode() {
    local mode
    case $KEYMAP in
        vicmd)
          mode=NORMAL
          ;;
        main|viins)
          mode=INSERT
          ;;
    esac
    print -n -- $mode
}

zle-keymap-select() {
    __set_vi_mode_cursor
    zle reset-prompt
}

zle-line-init() {
    zle -K $DEFAULT_VI_MODE
}

zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
zle -N edit-command-line



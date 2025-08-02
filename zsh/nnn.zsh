n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# nnn tokyonight-day theme
# A light theme for nnn file manager inspired by tokyonight

# Color codes (using xterm 256 colors):
# The format is 12 concatenated 2-character codes for:
# BLK-CHR-DIR-EXE-REG-HARDLINK-SYMLINK-MISSING-ORPHAN-FIFO-SOCK-OTHER

# Individual color definitions for clarity
BLK="08"      # Block device - Gray
CHR="08"      # Character device - Gray
DIR="04"      # Directory - Blue
EXE="02"      # Executable - Green
REG="00"      # Regular file - Default/Black
HARDLINK="05" # Hard link - Magenta
SYMLINK="06"  # Symbolic link - Cyan
MISSING="08"  # Missing file - Gray
ORPHAN="01"   # Orphaned symlink - Red
FIFO="03"     # FIFO - Yellow
SOCK="05"     # Socket - Magenta
OTHER="08"    # Other - Gray

# Export the concatenated color string
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# For reference, the complete string is:
# export NNN_FCOLORS="080804020005060801030508"

# Additional nnn configuration for a complete tokyonight-day experience
export NNN_COLORS="5236"  # Context colors (light theme appropriate)

export NNN_BMS='c:~/code/caribou/main-repo;t:/tmp;D:~/Downloads/'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;o:fzopen;z:autojump'
#export NNN_COLORS='1234'
export NNN_OPTS='exAd'
export NNN_ORDER='t:~/Downloads'

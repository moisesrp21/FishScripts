function copy
    #osascript -e "set the clipboard to \"$argv\""
    if test -f $argv[1]
        set -l path (realpath $argv[1])
        osascript -e "set the clipboard to POSIX file \"$path\""
        if test (count $argv) = 2
            cp $argv[1] $argv[2]
        end
    else
        osascript -e "set the clipboard to \"$argv\""
    end
end

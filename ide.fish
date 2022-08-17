function ide
    echo "project:  " $argv[1]
    cd ~/Desktop/Today
    tmux renamew [NOTES]
    if test $argv = "netvim"
        set dir ~/Desktop/DEV/Electron/NetVim
        echo "directory " $dir 
        tmux new-window -n [SERVER] -c $dir
        tmux new-window -n [netvim] -c $dir
    end
end

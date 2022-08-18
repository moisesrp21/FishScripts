function ide
    set -l name (basename $argv[1])
    echo "provided path:    " $argv[1] 
    echo "Project:  " $name
    cd $today
    tmux renamew [NOTES]
    set current_project $argv[1]
    tmux new-window -n [SERVER] -c $argv[1]
    tmux new-window -n [app] -c $argv[1]
end

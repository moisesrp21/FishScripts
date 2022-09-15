function ide
    if test -d $argv[1]
        set -l name (basename $argv[1])
        echo "provided path:    " $argv[1] 
        set current_project $argv[1]
        cd $today
        tmux renamew [NOTES]
        set current_project $argv[1]
        tmux new-window -n [SERVER] -c $argv[1]
        tmux new-window -n [app] -c $argv[1]
    else
        echo argument must be a path to a project
    end
end

function rename_function
    set -l old_name $argv[1]
    set -l new_name $argv[2]
    if test $old_name = $new_name
        return
    end

    functions --copy $old_name $new_name
    functions --erase $old_func

    set -l saved_func $HOME/.config/fish/functions/$old_func.fish
    if test -f $saved_func
        funcsave $new_func
        rm $saved_func
    end
end

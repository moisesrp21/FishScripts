function rendir
    set arr (ls)
    for str in $arr
        mv $str (string replace "_Workspace" "" $str)
    end
end

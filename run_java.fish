function run_java
    set ext .java
    begin; javac $argv$ext 2>|read -z err; end |read -z out
    if test -z $err 
        java $argv 
    else
        echo $err > debug.txt
    end
end

function run
    set_color $fish_color_comment; echo "javac" $argv[1]
    set_color normal; javac $argv[1]
    set_color $fish_color_comment; echo "java" $argv[1] $argv[2]
    set_color normal; java $argv[1] $argv[2] 
    #> output.html
    #open output.html
end

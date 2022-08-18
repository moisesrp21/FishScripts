function mf
    mkdir -p $argv[1]
    for i in $argv[2..-1];
        touch $argv[1]/$i;
    end;

end

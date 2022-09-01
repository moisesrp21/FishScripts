function fl
    switch $argv[1]
        case '-n'
            echo (string split -r -m1 . $argv[2])[1]    
        case '-e'
            echo (string split -r -m1 . $argv[2])[2]
        case '*'
            echo "-n <file> returns file name"
            echo "-e <file> returns file extension"
    end
end

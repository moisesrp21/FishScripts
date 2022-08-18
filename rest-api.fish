function rest-api
    switch $argv[1]
        case 'post'
            # the path to the file with the data being sent
            set -l data $argv[2]
            echo $data
            # the url of the rest api
            set -l destination $argv[3]
            # check whether is a file or not
            if test -f $data
                # get the file extention
                set -l file (string split -r -m1 . $data)
                set -l extension $file[2]
                switch $extension
                    case 'json'
                        curl -X POST -H "Content-Type: application/json" -d $data $destination | jq -C --indent 4  
                    case 'txt'    
                        curl -X POST -H "Content-Type: text/plain" -d $data $destination | jq -C --indent 4    
                    case 'html'
                        curl -X POST -H "Content-Type: text/html" -d $data $destination | jq -C --indent 4    
                    case '*'
                        echo $file
                end
            else
                if test (string match -e "{" $data)
                    curl -X POST -H "Content-Type: application/json" -d $data $destination | jq -C --indent 4  
                else
                    curl -X POST -d $data $destination | jq -C --indent 4  
                end
            end
        case 'get'
            curl -X GET $argv[2] | jq -C --indent 4  
        case '*'
            echo 'is something else'
    end
end

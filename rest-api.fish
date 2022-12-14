# rest-api get ./data.json http://localhost:9000
# rest-api get {"msg": "hello"} http://localhost:9000
# rest-api post ./data.json http://localhost:9000
# rest-api post {"msg": "hello"} http://localhost:9000
# rest-api post {"msg": "hello"} http://localhost:9000
function rest-api
    switch $argv[1]
        case 'post'
            # the path to the file with the data being sent
            set -l data $argv[2]
            # the url of the rest api
            set -l destination $argv[3]
            # check whether is a file or not
            if test -f $data
                # get the file extention
                set -l file (string split -r -m1 . $data)
                set -l extension $file[2]
                switch $extension
                    case 'json'
                        curl -X POST -H "Content-Type: application/json" -d @$data $destination 
                    case 'txt'    
                        curl -X POST -H "Content-Type: text/plain" -d @$data $destination 
                    case 'html'
                        curl -X POST -H "Content-Type: text/html" -d @$data $destination 
                    case '*'
                        echo $file
                end
            else
                if test (string match -e "{" $data)
                    curl -X POST -H "Content-Type: application/json" -d $data $destination 
                else
                    curl -X POST -d @$data $destination 
                end
            end
        case 'get'
            if test -f $argv[2]
                curl -X GET -H "Content-Type: application/json" -d @$argv[2] $argv[3]
            else 
                if test (string match -e "{" $argv[2]) 
                    curl -X GET _H "Content-Type: application/json" -d $argv[2] $argv[3]
                end
                curl -X GET $argv[2]
            end
        case '*'
            echo 'is something else'
    end
end

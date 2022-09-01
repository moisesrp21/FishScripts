function fln --description 'gets the file name'
    echo (string split -r -m1 . $argv)[1]
end

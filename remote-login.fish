function remote-login
    switch $argv[1]:
        case 'on':
            sudo systemsetup -setremotelogin on 
        case 'off':
            sudo systemsetup -setremotelogin off 
        case 'status':
            sudo systemsetup -getremotelogin
        case '*':
            echo 'everything else'
    end
end

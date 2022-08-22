function github --description open\ the\ project\'s\ remote\ repository\ on\ the\ browser
    set -l website (string split -r -m1 . (git remote get-url origin))
    open $website[1]
end

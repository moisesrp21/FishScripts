function get_media
    curl rate.sx
    curl wttr.in
    set_color red; echo "My Public IP:";
    set_color green; curl ifconfig.co;
    #curl getnews.tech
    #curl 'dict://dict.org/d:love'
end

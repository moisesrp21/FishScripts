function emacs
   for i in (echo $argv | sed 's|--*|\\'\n'|g' | grep -v '^$')
       echo $i | read -l flag value
       switch $flag
           case h
               echo "-h -help           => shows this help menu"
               echo "-g -gui <arg>      => opens the Emacs.app <args>"
               echo "-t -terminal <arg> => opens /usr/local/bin/emacs <args>"
           case g gui
               # /Applications/Emacs.app/Contents/MacOS/Emacs $argv
               open -a "Emacs" --args $value
           case t terminal 
               /usr/local/bin/emacs $value
       end
   end
end

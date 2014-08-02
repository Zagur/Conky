    #!/bin/bash
    # By helmuthdu
     
    MIN="min"
    MAX="max"
    CUR="cur"
    UNIT="c"
     
    if [ "$1" = "$CUR" ]; then
            if [ "$3" = "$UNIT" ]; then
            curl -s --connect-timeout 30 "http://weather.yahooapis.com/forecastrss?p=$2&u=$3" | sed '/Current\ Conditions/,$!d' | sed -e 's/<[^>]*>//g' | sed '2!d' | sed 's/^.*, //' | sed 's/ C.*$//'
            else
            curl -s --connect-timeout 30 "http://weather.yahooapis.com/forecastrss?p=$2&u=$3" | sed '/Current\ Conditions/,$!d' | sed -e 's/<[^>]*>//g' | sed '2!d' | sed 's/^.*, //' | sed 's/ F.*$//'
            fi
    elif [ "$1" = "$MAX" ]; then
    curl -s --connect-timeout 30 "http://weather.yahooapis.com/forecastrss?p=$2&u=$3" | sed '/Current\ Conditions/,$!d' | sed -e 's/<[^>]*>//g' | sed '4!d' | sed 's/^.*High: //' | sed 's/ Low.*$//'
    elif [ "$1" = "$MIN" ]; then
    curl -s --connect-timeout 30 "http://weather.yahooapis.com/forecastrss?p=$2&u=$3" | sed '/Current\ Conditions/,$!d' | sed -e 's/<[^>]*>//g' | sed '4!d' | sed 's/^.*Low: //'
    fi 

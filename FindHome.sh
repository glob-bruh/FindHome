
#!/bin/bash

printf "Find Home = By GlobBruh\n\n"

if [ "$1" = 'h' ]
then FINDHOMESearchString=$(whiptail --title 'Find Home = By GlobBruh' --inputbox 'Search String (Hidden Files Enabled):' --ok-button "Search" 10 75 3>&1 1>&2 2>&3)
else FINDHOMESearchString=$(whiptail --title 'Find Home = By GlobBruh' --inputbox 'Search String:' --ok-button "Search" 10 75 3>&1 1>&2 2>&3)
fi

if test -z "$FINDHOMESearchString" 
then printf "Exiting...\n" ; exit
fi

printf "============\nSearching...\n============\n"

if [ "$1" = 'h' ]
then find /home/$(whoami)/ 2>/dev/null | grep $FINDHOMESearchString > /tmp/findhomeresult
else find /home/$(whoami)/ -not -path '*/.*' 2>/dev/null | grep $FINDHOMESearchString > /tmp/findhomeresult
fi

whiptail --scrolltext --title "Find Home = Results" --msgbox "Top 1200 Results for [$(echo $FINDHOMESearchString)]:\n\n$(cat /tmp/findhomeresult | head -n1200)" --ok-button "Close and Exit" 25 130

printf "\nDone!\n"
exit

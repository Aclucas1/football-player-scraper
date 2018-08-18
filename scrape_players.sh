#!/bin/bash
rm players.json
wget -O players.html https://www.si.com/college-football/2018/06/18/top-100-player-rankings-jarrett-stidham-tua-tagovailoa 
cat players.html | grep "<div class=\"component heading-container\"><h3>" | awk -F">" '{print $3}' | sed 's/,//g' | sed 's/\.//g' | awk -F"<" '{print $1}' >> players.txt
rm players.html
./rr.sh players.txt
rm players.txt
cat players.json

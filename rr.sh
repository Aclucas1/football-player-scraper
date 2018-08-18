#!/bin/bash

echo "{" >> players.json

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "  {" >> players.json
    echo "    \"ranking\": `echo $line | awk -F" " '{print $1}'`," >> players.json
    echo "    \"firstname\": \"`echo $line | awk -F" " '{print $2}'`\"," >> players.json
    echo "    \"lastname\": \"`echo $line | awk -F" " '{print $3}'`\"," >> players.json
    echo "    \"position\": \"`echo $line | awk -F" " '{print $4}'`\"," >> players.json
    echo "    \"school\": \"`echo $line | awk -F" " '{print $5}'`\"" >> players.json
    echo "  }," >> players.json
done < "$1"

echo "}" >> players.json

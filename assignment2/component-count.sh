#!/bin/bash

if [[ $# -lt 1 ]];
then
    echo "Error: File path and component name are missing "
    exit 1
elif [[ $# -eq 0 ]];
then 
    echo "Error: Component names are missing "
    exit 1
else
    shift
    cd ./integrify_frontend-project_ecommerce
    for component in "$@" ; do
        count=$(grep -roh "<\s*${component}\(>\| \)" | wc -l)
        echo "$component - $count" >> ../output.txt
    done
fi

#!/bin/bash

if [[ $# -eq 1 ]];
then
    cd $1
    git shortlog -sn |
    awk '{print $2" "$3" - "$1}' > ../output.txt
elif [[ $# -eq 0 ]];
then
    echo "Error: File path is missing"
    exit 1
else
    cd $1
    for name in "$@" ; do
        git shortlog -sn | grep "$name" |
        awk '{print $2" "$3" - "$1}' >> ../output.txt
    done
fi
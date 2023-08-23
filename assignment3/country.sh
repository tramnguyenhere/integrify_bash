#!/bin/bash

if [[ $# -lt 1 ]];
then
    echo "Error: Country names are missed"
    exit 1
else
    for country in "$@";
    do
        response=$(curl -s "https://restcountries.com/v3/name/${country}?fullText=true")

        echo "Country: $(echo $response | jq -r '.[0].name.common')" >> ../output.txt
        echo "Capital: $(echo $response | jq -r '.[0].capital[0]')" >> ../output.txt
        echo "Population: $(echo $response | jq -r '.[0].population')" >> ../output.txt
        echo "Languages: $(echo $response | jq -r '.[0].languages | .[]')" >> ../output.txt
        echo "" >> ../output.txt
    done
fi
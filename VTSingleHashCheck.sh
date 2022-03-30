#!/bin/bash
echo enter your hash
read hash
echo enter your api key
read apikey
echo enter output file path
read outputfile
echo "You have entered the following API key:"$apikey" and "$hash" combination that will be stored in "$outputfile""
curl --request GET --url "https://www.virustotal.com/vtapi/v2/file/report?apikey="$apikey"&resource="$hash""  | jq '.' > $outputfile
sleep 2
tail -n 13 $outputfile

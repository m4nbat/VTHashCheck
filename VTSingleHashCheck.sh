#!/bin/bash
echo 'enter hash'
read hash
echo "$hash"
echo 'enter output filename'
read $outputfile
curl --request GET --url "https://www.virustotal.com/vtapi/v2/file/report?apikey=<YOUR API KEY HERE>&resource=$hash"  | jq '.' > $outputfile
sleep 2
tail -n 13 $outputfile

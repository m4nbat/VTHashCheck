#!/bin/bash
echo enter your api key
read apikey
echo 'please enter the path of your hashes file'
read hashfile
echo 'please enter your output filename'
read outputfile
while read -r hash; do
echo "$hash"
curl --request GET --url "https://www.virustotal.com/vtapi/v2/file/report?apikey="$apikey"&resource="$hash""  | jq '.' >> $outputfile
done <"$hashfile"
sleep 2
egrep '(scan_id|sha256|sha1|md5|scan_date|permalink|total|positives)' $outputfile
echo 'hashes appended to a file called ' $outputfile

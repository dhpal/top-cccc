#!/bin/bash

# This script will fetch all of the buckets tags, along with the corresponding buvket names

#bucketlist=`aws s3 ls | awk -F ' ' '{print $3}'` 

#for bucket in $bucketlist
#do
#	value=$(aws s3api get-bucket-tagging --bucket $bucket | awk -F '|' '{print $3,$4}' | tail -6 | tail -4)
	#echo $value  | xargs -n 2 | awk '{print $1 "              "      $2}' >> tag_name_fine_script_output.txt
	#echo $value  | xargs -n 2 | awk '{print "Key: " $1 "\t\tValue: " $2}' >> tag_name_fine_script_output.txt

	
	#echo $value  | xargs -n 2 | awk '{print "Key: " $1 "\t\tValue: " $2}' | tail -4 | head -3 >> tag_name_fine_script_output.txt
	
	
	#echo -e "$value\n\n\n\n  | xargs -n 2 | awk '{print "Key: " $1 "\t\tValue: " $2}'" | head -3 >> tag_name_fine_script_output.txt

#	echo -e "\e[31;4m$bucket\e[0m\n $value\n"  >> tag_name_fine_script_output.txt
#done




bucketlist=`aws s3 ls | awk -F ' ' '{print $3}'` 

for bucket in $bucketlist
do
	value=$(aws s3api get-bucket-tagging --bucket $bucket | awk -F '|' '{print $3,$4}' | grep -v TagSet | tail -n+5)

	echo -e "\e[31;4m$bucket:\e[0m\n $value\n"  >> tag_name_fine_script_output.txt
done

# This script updates the tags specified in tag.json file for all S3 buckets listed by ls command
#!/bin/bash

bucketlist=`aws s3 ls | awk -F ' ' '{print $3}'`

for bucket in $bucketlist
do
	aws s3api put-bucket-tagging --bucket $bucket --tagging file://tag.json
	echo $bucket
done


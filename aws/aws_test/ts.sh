echo "Bucketname,Key,Value" >> /tmp/details-bucket
for i in `aws s3 ls | awk '{print $3}'`
do 
aws s3api get-bucket-tagging --bucket $i > /tmp/bucketdetail 
for j in `tail -n +8 /tmp/bucketdetail | cut -f 3,4 -d "|" | tr "|" "," | tr  " " "," | tr -s "," | cut -f 2,3 -d ","`
do
echo "$i,$j" >> /tmp/details-bucket
done
done


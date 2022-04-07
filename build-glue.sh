#!/bin/bash

STACKNAME=tempalte-glue
S3BUCKETNAME=sh10-datalake-bucket

aws s3 cp glue-job.py s3://${S3BUCKETNAME}/scripts/

aws cloudformation create-stack \
--stack-name ${STACKNAME} \
--template-body file://./glue-stack.yml \
--parameters ParameterKey=S3BucketName,ParameterValue=${S3BUCKETNAME} \
--capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-create-complete \
--stack-name ${STACKNAME}

echo "Glue 作成完了"

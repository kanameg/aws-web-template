#!/bin/bash

STACKNAME=tempalte-glue
S3BUCKETNAME=sh10-datalake-bucket

aws cloudformation create-stack \
--stack-name ${STACKNAME} \
--template-body file://glue-stack.yml \
--parameters ParameterKey=S3BucketName,ParameterValue=${S3BUCKETNAME} \
--capabilities CAPABILITY_NAMED_IAM

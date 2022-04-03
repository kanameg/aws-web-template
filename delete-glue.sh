#!/bin/bash

STACKNAME=tempalte-glue
S3BUCKETNAME=sh10-datalake-bucket

aws cloudformation delete-stack \
--stack-name ${STACKNAME}

aws s3 rm s3://${S3BUCKETNAME}/output/parquet/sales/o/ --recursive

aws cloudformation wait stack-delete-complete \
--stack-name ${STACKNAME}

echo "Glue 削除完了"
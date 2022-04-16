#!/bin/bash

STACKNAME=tempalte-network
S3URL=s3://template-bucket-template/template/

# テンプレートファイル削除
#aws s3 rm ${S3URL} --recursive

# スタック削除
aws cloudformation delete-stack \
--stack-name ${STACKNAME}

# スタックの削除待ち
aws cloudformation wait stack-delete-complete \
--stack-name ${STACKNAME}



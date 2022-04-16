#!/bin/bash

STACK_NAME=tempalte-network
S3_URL=s3://template-bucket-template/template/

# テンプレートファイル削除
aws s3 rm ${S3_URL} --recursive

# スタック削除
aws cloudformation delete-stack \
--stack-name ${STACK_NAME}

# スタックの削除待ち
aws cloudformation wait stack-delete-complete \
--stack-name ${STACK_NAME}

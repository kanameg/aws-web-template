#!/bin/bash

SYSTEM=tempalte
S3_URL=s3://template-bucket-template/template
ROOT_TEMPLATE=./network.yml
STACK_NAME=${SYSTEM}-network

# テンプレートファイルを転送
aws s3 cp ../network/ ${S3_URL}/network/ --recursive
aws s3 cp ../ec2/ ${S3_URL}/ec2/ --recursive


# スタックの更新
aws cloudformation update-stack \
--stack-name ${STACK_NAME} \
--parameters ParameterKey=System,ParameterValue=${SYSTEM} \
--template-body file://${ROOT_TEMPLATE}

# 作成完了待ち
aws cloudformation wait stack-update-complete \
--stack-name ${STACK_NAME}

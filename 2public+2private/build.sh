#!/bin/bash

SYSTEM=tempalte
S3_URL=s3://template-bucket-template/template/
ROOT_TEMPLATE=./network.yml
STACK_NAME=${SYSTEM}-network

# テンプレートファイルをコピー
aws s3 cp ../network ${S3_URL} --recursive

# スタックの作成
aws cloudformation create-stack \
--stack-name ${STACK_NAME} \
--parameters ParameterKey=System,ParameterValue=${SYSTEM} \
--template-body file://${ROOT_TEMPLATE}

# 作成完了待ち
aws cloudformation wait stack-create-complete \
--stack-name ${STACK_NAME}

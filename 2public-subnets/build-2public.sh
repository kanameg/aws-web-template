#!/bin/bash

ROOTTEMPLATE=./network-2public.yml
STACKNAME=tempalte-network
S3URL=s3://template-bucket-template/template/

# テンプレートファイルのコピー
aws s3 cp network/network-vpc.yml ${S3URL}network/
aws s3 cp network/network-public-subnet.yml ${S3URL}network/
aws s3 cp network/network-internet-gateway.yml ${S3URL}network/

# スタックの作成
aws cloudformation create-stack \
--stack-name ${STACKNAME} \
--template-body file://${ROOTTEMPLATE}

# 作成完了待ち
aws cloudformation wait stack-create-complete \
--stack-name ${STACKNAME}

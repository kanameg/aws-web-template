#!/bin/bash

ROOTTEMPLATE=./network-2public2private.yml
STACKNAME=tempalte-network
S3URL=s3://template-bucket-template/template/

# テンプレートファイルのコピー
aws s3 cp network/network-vpc.yml ${S3URL}network/
aws s3 cp network/network-public-subnet.yml ${S3URL}network/
aws s3 cp network/network-internet-gateway.yml ${S3URL}network/
aws s3 cp network/network-nat-gateway.yml ${S3URL}network/
aws s3 cp network/network-private-subnet.yml ${S3URL}network/
aws s3 cp network/network-scurity-group.yml ${S3URL}network/

# スタックの更新
aws cloudformation update-stack \
--stack-name ${STACKNAME} \
--template-body file://${ROOTTEMPLATE}

# 作成完了待ち
aws cloudformation wait stack-update-complete \
--stack-name ${STACKNAME}

#!/bin/bash

STACKNAME=tempalte-network
S3URL=s3://template-bucket-template/template/

# テンプレートファイルのコピー
aws s3 cp network-vpc.yml ${S3URL}
aws s3 cp network-public-subnet.yml ${S3URL}
aws s3 cp network-internet-gateway.yml ${S3URL}
#aws s3 cp network-security-group.yml ${S3URL}
#aws s3 cp ec2.yml ${S3URL}

# スタックの作成
aws cloudformation create-stack \
--stack-name ${STACKNAME} \
--template-body file://./network-2public.yml

# 作成完了待ち
aws cloudformation wait stack-create-complete \
--stack-name ${STACKNAME}

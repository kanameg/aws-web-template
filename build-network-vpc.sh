#!/bin/bash

STACKNAME=tempalte-vpc-stack
VPCNAME=tempalte-vpc

aws cloudformation create-stack \
--stack-name ${STACKNAME} \
--template-body file://./network-vpc.yml \
--parameters ParameterKey=VpcName,ParameterValue=${VPCNAME} \

aws cloudformation wait stack-create-complete \
--stack-name ${STACKNAME}

echo "VPC ${STACKNAME} 作成完了"

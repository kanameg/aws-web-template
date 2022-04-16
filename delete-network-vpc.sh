#!/bin/bash

STACKNAME=tempalte-vpc-stack

aws cloudformation delete-stack \
--stack-name ${STACKNAME}

aws cloudformation wait stack-delete-complete \
--stack-name ${STACKNAME}

echo "VPC ${STACKNAME} 削除完了"
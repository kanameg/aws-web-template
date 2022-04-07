#!/bin/bash

VPCID=vpc-0563273dd3c38a4a0
SUBNETID1=subnet-0b081f95a9a1cb9cf
SUBNETID2=subnet-0e346a06d50d662fd
SECURITYGROUPID=sg-013629a65574c7aaf

aws cloudformation create-stack \
--stack-name tempalte-interface-vpce \
--template-body file://./interface-vpce-stack.yml \
--parameters ParameterKey=VpcId,ParameterValue=${VPCID} ParameterKey=SubnetId1,ParameterValue=${SUBNETID1} \
ParameterKey=SubnetId2,ParameterValue=${SUBNETID2} ParameterKey=SecurityGroupId,ParameterValue=${SECURITYGROUPID}

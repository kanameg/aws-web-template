#!/bin/bash

VPCID=vpc-0563273dd3c38a4a0
#ROUTETABLEID1=rtb-02713a399b3306f5e
ROUTETABLEID1=rtb-0c40deea78844c016

aws cloudformation create-stack \
--stack-name tempalte-gateway-vpce \
--template-body file://./gateway-vpce-stack.yml \
--parameters ParameterKey=RouteTableId1,ParameterValue=${ROUTETABLEID1} ParameterKey=VpcId,ParameterValue=${VPCID}

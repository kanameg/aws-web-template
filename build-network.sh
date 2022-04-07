#!/bin/bash

aws cloudformation create-stack \
--stack-name tempalte-network \
--template-body file://./network-stack.yml

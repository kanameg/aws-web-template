#!/bin/bash

STACKNAME=tempalte-glue

aws cloudformation delete-stack \
--stack-name ${STACKNAME}

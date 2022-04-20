#!/bin/bash
yum -y update
# venv環境構築
python3 -m venv /tmp/venv/flask
source /tmp/venv/flask/bin/activate
pip install -U pip
# flaskインストール
pip install flask

#!/bin/sh 

git pull
source env/bin/activate
pip install -r requirements/local.txt
./manage.py runserver_plus 0.0.0.0:8002
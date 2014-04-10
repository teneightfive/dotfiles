#!/bin/sh 

git checkout develop
git pull
source env/bin/activate
pip install -r requirements/local.txt
./manage.py runserver_plus 8002